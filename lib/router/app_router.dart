import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../config/color_scheme.dart';
import '../providers/consent_provider.dart';
import '../screens/consent/consent_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/kanji/kanji_list_screen.dart';
import '../screens/kanji/kanji_detail_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/favorites/favorites_screen.dart';
import '../screens/quiz/quiz_menu_screen.dart';
import '../screens/quiz/quiz_config_screen.dart';
import '../screens/quiz/quiz_play_screen.dart';
import '../screens/quiz/quiz_result_screen.dart';
import '../screens/stats/stats_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/settings/terms_screen.dart';
import '../screens/settings/privacy_screen.dart';
import '../screens/settings/about_screen.dart';
import '../widgets/main_scaffold.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final consentAccepted = ref.watch(consentProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    redirect: (context, state) {
      final isConsentRoute = state.matchedLocation == '/consent';
      if (!consentAccepted && !isConsentRoute) {
        return '/consent';
      }
      if (consentAccepted && isConsentRoute) {
        return '/';
      }
      return null;
    },
    routes: [
      // Consent Screen
      GoRoute(
        path: '/consent',
        name: 'consent',
        builder: (context, state) => const ConsentScreen(),
      ),

      // Shell Route for main navigation (4 tabs)
      ShellRoute(
        builder: (context, state, child) => MainScaffold(child: child),
        routes: [
          // Home (Dashboard)
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const HomeScreen(),
          ),

          // Kanji
          GoRoute(
            path: '/kanji',
            name: 'kanji',
            builder: (context, state) => const KanjiListScreen(),
          ),

          // Search
          GoRoute(
            path: '/search',
            name: 'search',
            builder: (context, state) => const SearchScreen(),
          ),

          // Favorites
          GoRoute(
            path: '/favorites',
            name: 'favorites',
            builder: (context, state) => const FavoritesScreen(),
          ),

          // Quiz
          GoRoute(
            path: '/quiz',
            name: 'quiz',
            builder: (context, state) => const QuizMenuScreen(),
          ),

          // Stats
          GoRoute(
            path: '/stats',
            name: 'stats',
            builder: (context, state) => const StatsScreen(),
          ),

          // Settings
          GoRoute(
            path: '/settings',
            name: 'settings',
            builder: (context, state) => const SettingsScreen(),
            routes: [
              GoRoute(
                path: 'terms',
                name: 'terms',
                builder: (context, state) => const TermsScreen(),
              ),
              GoRoute(
                path: 'privacy',
                name: 'privacy',
                builder: (context, state) => const PrivacyScreen(),
              ),
              GoRoute(
                path: 'about',
                name: 'about',
                builder: (context, state) => const AboutScreen(),
              ),
            ],
          ),
        ],
      ),

      // Kanji Detail (outside shell for full-screen)
      GoRoute(
        path: '/kanji/:id',
        name: 'kanjiDetail',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return KanjiDetailScreen(kanjiId: id);
        },
      ),

      // Quiz Config
      GoRoute(
        path: '/quiz/config/:type',
        name: 'quizConfig',
        builder: (context, state) {
          final type = state.pathParameters['type']!;
          return QuizConfigScreen(quizType: type);
        },
      ),

      // Quiz Play
      GoRoute(
        path: '/quiz/play/:type',
        name: 'quizPlay',
        builder: (context, state) {
          final type = state.pathParameters['type']!;
          final extra = state.extra as Map<String, dynamic>?;
          return QuizPlayScreen(
            quizType: type,
            jlptLevel: extra?['jlptLevel'] as int?,
            questionCount: extra?['questionCount'] as int? ?? 10,
          );
        },
      ),

      // Quiz Result
      GoRoute(
        path: '/quiz/result',
        name: 'quizResult',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return QuizResultScreen(sessionResult: extra['result']);
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: AppColors.error),
            const SizedBox(height: 16),
            Text(
              '페이지를 찾을 수 없습니다',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('홈으로 돌아가기'),
            ),
          ],
        ),
      ),
    ),
  );
});
