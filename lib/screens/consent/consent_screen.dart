import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/consent_provider.dart';

class ConsentScreen extends ConsumerStatefulWidget {
  const ConsentScreen({super.key});

  @override
  ConsumerState<ConsentScreen> createState() => _ConsentScreenState();
}

class _ConsentScreenState extends ConsumerState<ConsentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('약관 동의'),
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '이용약관'),
            Tab(text: '개인정보처리방침'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _MarkdownTab(asset: 'assets/legal/terms.md'),
                _MarkdownTab(asset: 'assets/legal/privacy.md'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '위 이용약관과 개인정보처리방침에 동의하셔야 앱을 이용하실 수 있습니다.',
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => SystemNavigator.pop(),
                          child: const Text('거부'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: FilledButton(
                          onPressed: () async {
                            await ref.read(consentProvider.notifier).accept();
                            if (context.mounted) {
                              context.go('/');
                            }
                          },
                          child: const Text('동의합니다'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MarkdownTab extends StatelessWidget {
  final String asset;
  const _MarkdownTab({required this.asset});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: rootBundle.loadString(asset),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('문서를 불러올 수 없습니다'));
        }
        return Markdown(data: snapshot.data ?? '');
      },
    );
  }
}
