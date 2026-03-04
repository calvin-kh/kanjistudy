# CLAUDE.md

## Project Overview

**KanjiStudy** - JLPT N5~N1 상용한자 2,136자 학습 Flutter 앱.
완전 로컬/오프라인 앱. 로그인 없음, 서버 없음, AI 없음.

## Tech Stack

| Area | Technology |
|------|-----------|
| Framework | Flutter (Dart 3.8.0+) - Android/iOS/Web |
| State Management | Riverpod (flutter_riverpod + riverpod_annotation) |
| Navigation | GoRouter (ShellRoute for bottom nav) |
| Local DB | SQLite (sqflite) |
| Models | Freezed + json_serializable (code generation) |
| Search | fuzzywuzzy (fuzzy matching) |

## Build & Run

```bash
cd C:\project\claudecode\KanjiStudy
flutter pub get
flutter run -d chrome
flutter run
dart run build_runner build --delete-conflicting-outputs
```

## Code Style

- Freezed + json_serializable for immutable models
- Riverpod for state management
- Repository pattern: DatabaseService singleton -> repositories
- GoRouter with ShellRoute for bottom navigation
- Korean (한국어) for all user-facing UI strings
- No userId in any model or query (fully local)
- File naming: snake_case, Class naming: PascalCase

## Project Structure

```
lib/
├── main.dart, app.dart
├── config/          # Design tokens (Teal-based)
├── database/        # SQLite only (no sync)
├── models/          # Freezed data models
├── repositories/    # CRUD + search + filter
├── providers/       # Riverpod state
├── services/        # DataLoader, VersionCheck
├── router/          # GoRouter (no auth redirect)
├── screens/         # 14 screens
└── widgets/         # Shared UI components
```

## Database Schema (7 tables, no userId)

- `kanji` - 한자 마스터 데이터 (character UNIQUE)
- `favorites` - 즐겨찾기 (kanjiId UNIQUE)
- `study_progress` - 학습 진도 (kanjiId UNIQUE)
- `quiz_item_stats` - 한자별 퀴즈 통계
- `quiz_results` - 개별 퀴즈 답안 기록
- `daily_goals` - 일별 학습 목표 추적
- `app_meta` - 앱 메타데이터

## Navigation (4 tabs)

| Tab | Route | Screen |
|-----|-------|--------|
| Home | `/` | 대시보드 |
| Kanji | `/kanji` | JLPT 레벨별 한자 목록 |
| Quiz | `/quiz` | 퀴즈 메뉴→설정→플레이→결과 |
| Settings | `/settings` | 테마, 목표, 이용약관 |

## Design System

- Primary: Teal #0D9488
- JLPT: N5=Green, N4=Blue, N3=Purple, N2=Orange, N1=Red
- 음독: Teal, 훈독: Violet
- Dark/Light theme support

## Quiz Types (3종)

1. 한자→뜻 (4지선다)
2. 뜻→한자 (4지선다)
3. 한자→읽기 (4지선다)
