import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('이용약관')),
      body: FutureBuilder<String>(
        future: rootBundle.loadString('assets/legal/terms.md'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('이용약관을 불러올 수 없습니다'));
          }
          return Markdown(data: snapshot.data ?? '');
        },
      ),
    );
  }
}
