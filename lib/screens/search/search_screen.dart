import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/spacing.dart';
import '../../providers/kanji_provider.dart';
import '../../providers/favorite_provider.dart';
import '../../widgets/kanji_card.dart';
import '../../widgets/empty_state.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final results = ref.watch(kanjiSearchResultsProvider);
    final query = ref.watch(kanjiSearchQueryProvider);
    final favoriteIds = ref.watch(favoriteIdsProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: '한자, 읽기, 의미 검색...',
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          onChanged: (value) {
            ref.read(kanjiSearchQueryProvider.notifier).state = value;
          },
        ),
        actions: [
          if (query.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _controller.clear();
                ref.read(kanjiSearchQueryProvider.notifier).state = '';
              },
            ),
        ],
      ),
      body: query.isEmpty
          ? const EmptyState(
              icon: Icons.search,
              title: '한자를 검색하세요',
              subtitle: '문자, 읽기(히라가나/카타카나), 의미로 검색할 수 있습니다',
            )
          : results.when(
              data: (list) {
                if (list.isEmpty) {
                  return EmptyState(
                    icon: Icons.search_off,
                    title: '검색 결과가 없습니다',
                    subtitle: '"$query"에 대한 결과를 찾을 수 없습니다',
                  );
                }
                return ListView.separated(
                  padding: AppSpacing.screenPadding,
                  itemCount: list.length,
                  separatorBuilder: (_, __) => AppSpacing.gapSm,
                  itemBuilder: (context, index) {
                    final kanji = list[index];
                    return KanjiListCard(
                      kanji: kanji,
                      isFavorite: favoriteIds.contains(kanji.id),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('오류: $e')),
            ),
    );
  }
}
