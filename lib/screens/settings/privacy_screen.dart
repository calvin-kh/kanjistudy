import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('개인정보처리방침')),
      body: FutureBuilder<String>(
        future: rootBundle.loadString('assets/legal/privacy.md'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('개인정보처리방침을 불러올 수 없습니다'));
          }
          return Markdown(data: snapshot.data ?? '');
        },
      ),
    );
  }
}
