# CLAUDE.md

## Project Overview

**칸지공부 (KanjiStudy)** - JLPT N5~N1 상용한자 2,136자 학습 Flutter 앱.
완전 로컬/오프라인 앱. 로그인 없음, 서버 없음, AI 없음.

- **회사**: kamuse.inc.
- **고객문의**: kamuse.app@kamuse.com
- **패키지**: `com.kanjistudy.app`
- **GitHub**: calvin-kh/kanjistudy
- **랜딩**: kanjistudy-one.vercel.app

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
flutter build apk           # 테스트용
flutter build appbundle      # Play Store AAB
dart run build_runner build --delete-conflicting-outputs
dart run flutter_launcher_icons  # 아이콘 재생성
```

## Release Signing

- Keystore: `android/app/upload-keystore.jks` (gitignored)
- Config: `android/key.properties` (gitignored)
- build.gradle.kts에서 key.properties 읽어서 release 서명

## Code Style

- Freezed + json_serializable for immutable models
- Riverpod for state management
- Repository pattern: DatabaseService singleton -> repositories
- GoRouter with ShellRoute for bottom navigation + consent redirect
- Korean (한국어) for all user-facing UI strings
- No userId in any model or query (fully local)
- File naming: snake_case, Class naming: PascalCase
- **TextStyle에 color 하드코딩 금지** → Theme 자동 적용 (다크/라이트 대응)
- **TextScaler.noScaling** → app.dart builder에서 시스템 글자 크기 무시
- **ShellRoute 밖 풀스크린** → body에 `SafeArea(top: false)` 필수 (edge-to-edge 대응)
- **그리드 열 수** → 고정값 대신 화면 너비 기반 동적 계산

## Project Structure

```
lib/
├── main.dart, app.dart
├── config/          # Design tokens (Teal-based)
│   ├── color_scheme.dart  # AppColors (light/dark)
│   ├── typography.dart    # AppTypography (색상 없음, Theme 의존)
│   ├── theme.dart         # AppTheme (light/dark ThemeData)
│   └── spacing.dart       # AppSpacing
├── database/        # SQLite only (no sync)
├── models/          # Freezed data models
├── repositories/    # CRUD + search + filter
├── providers/       # Riverpod state + consent_provider
├── services/        # DataLoader, VersionCheck
├── router/          # GoRouter (consent redirect)
├── screens/         # 15 screens (consent 포함)
│   ├── consent/     # 최초 동의 화면
│   └── ...
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

## Navigation

| Tab | Route | Screen |
|-----|-------|--------|
| Home | `/` | 대시보드 |
| Kanji | `/kanji` | JLPT 레벨별 한자 목록 |
| Search | `/search` | 검색 |
| Favorites | `/favorites` | 즐겨찾기 |
| Quiz | `/quiz` | 퀴즈 메뉴→설정→플레이→결과 |
| Stats | `/stats` | 학습 통계 |
| Settings | `/settings` | 테마, 목표, 이용약관, 고객문의 |

- `/consent` - 최초 실행 약관 동의 (미동의 시 모든 라우트에서 redirect)

## Design System

- Primary: Teal #0D9488
- JLPT: N5=Green, N4=Blue, N3=Purple, N2=Orange, N1=Red
- 음독: Teal, 훈독: Violet
- Dark/Light theme support
- 앱 아이콘: 후지산 + 漢字 + べんきょう (PIL 생성)

## Landing Page

```
landing/
├── index.html       # 앱 소개 + Play Store 링크
├── terms.html       # 이용약관
├── privacy.html     # 개인정보처리방침
├── styles.css       # 반응형 다크 테마
├── screenshots/     # 12장 (모바일4 + 태블릿7"4 + 태블릿10"4)
└── vercel.json      # Vercel 설정
```

## Version History

| 버전 | versionCode | 내용 |
|------|------------|------|
| 1.0.0+1 | 1 | 초기 빌드 |
| 1.0.0+2 | 2 | 비공개 테스트 |
| 1.0.1+3 | 3 | 다크모드 수정 |
| 1.0.2+4 | 4 | 텍스트 색상 완전 수정 |
| 1.0.2+5 | 5 | 스와이프 네비게이션 + 즐겨찾기 오버레이 |
| 1.0.2+6 | 6 | 텍스트 스케일 고정 + 반응형 그리드 + edge-to-edge |
| 1.0.3+7 | 7 | 코드 최적화 (batch INSERT, N+1 fix, debounce, provider 정리) |
