# Design: 칸지공부 (KanjiStudy) v1.0

## 1. 기술 스택

| 영역 | 기술 | 선택 이유 |
|------|------|-----------|
| Framework | Flutter (Dart 3.8+) | 단일 코드베이스로 Android/iOS/Web 대응 |
| State Management | Riverpod | Provider보다 타입 안전, 테스트 용이 |
| Navigation | GoRouter | 선언적 라우팅, ShellRoute로 탭 네비게이션 |
| Local DB | SQLite (sqflite) | 오프라인 앱에 최적, 2,136개 한자 데이터 저장 |
| Models | Freezed + json_serializable | 불변 모델, 코드 생성으로 boilerplate 제거 |
| Search | fuzzywuzzy | 퍼지 매칭으로 오타 허용 검색 |

## 2. 아키텍처

### 2-1. 레이어 구조

```
┌──────────────────────────────────┐
│           Screens (UI)           │  Flutter Widgets
├──────────────────────────────────┤
│          Providers (State)       │  Riverpod Providers
├──────────────────────────────────┤
│        Repositories (Data)       │  CRUD 추상화
├──────────────────────────────────┤
│       DatabaseService (DB)       │  SQLite 싱글톤
├──────────────────────────────────┤
│          SQLite (Storage)        │  로컬 파일
└──────────────────────────────────┘
```

### 2-2. 디렉토리 구조

```
lib/
├── main.dart                    # 앱 진입점
├── app.dart                     # MaterialApp + ProviderScope
├── config/                      # 디자인 토큰
│   ├── color_scheme.dart        # AppColors (light/dark, JLPT 색상)
│   ├── typography.dart          # AppTypography (색상 없음)
│   ├── theme.dart               # AppTheme (ThemeData 조합)
│   └── spacing.dart             # AppSpacing (간격, 패딩, 반지름)
├── database/                    # SQLite 레이어
│   ├── database_service.dart    # 싱글톤 DB 인스턴스
│   └── database_schema.dart     # 7 테이블 DDL
├── models/                      # Freezed 데이터 모델
│   ├── kanji.dart               # Kanji, KanjiExample
│   ├── quiz.dart                # QuizQuestion, QuizResult, QuizSessionResult
│   ├── study_progress.dart      # StudyProgress, StudyStatus enum
│   └── daily_goal.dart          # DailyGoal
├── repositories/                # 데이터 접근 레이어
│   ├── kanji_repository.dart    # 한자 CRUD + 검색
│   ├── favorite_repository.dart # 즐겨찾기 CRUD
│   ├── progress_repository.dart # 학습 진도 관리
│   └── quiz_repository.dart     # 퀴즈 기록 + 통계
├── providers/                   # Riverpod 상태 관리
│   ├── kanji_provider.dart      # 한자 목록/상세/검색
│   ├── favorite_provider.dart   # 즐겨찾기 상태
│   ├── quiz_provider.dart       # 퀴즈 세션 관리
│   ├── stats_provider.dart      # 통계 데이터
│   ├── settings_provider.dart   # 테마, 일일 목표
│   └── consent_provider.dart    # 약관 동의 상태
├── services/                    # 비즈니스 로직
│   ├── data_loader_service.dart # JSON→SQLite 초기 데이터 로드
│   └── version_check_service.dart # 버전 관리
├── router/
│   └── app_router.dart          # GoRouter 설정
├── screens/                     # 화면 (15개)
│   ├── consent/consent_screen.dart
│   ├── home/home_screen.dart
│   ├── kanji/kanji_list_screen.dart
│   ├── kanji/kanji_detail_screen.dart
│   ├── search/search_screen.dart
│   ├── favorites/favorites_screen.dart
│   ├── quiz/quiz_menu_screen.dart
│   ├── quiz/quiz_config_screen.dart
│   ├── quiz/quiz_play_screen.dart
│   ├── quiz/quiz_result_screen.dart
│   ├── stats/stats_screen.dart
│   ├── settings/settings_screen.dart
│   ├── settings/terms_screen.dart
│   ├── settings/privacy_screen.dart
│   └── settings/about_screen.dart
└── widgets/                     # 공통 위젯
    ├── main_scaffold.dart       # 하단 탭 네비게이션 쉘
    ├── kanji_card.dart          # KanjiGridCard, KanjiListCard
    ├── jlpt_badge.dart          # JLPT 레벨 배지
    ├── reading_chip.dart        # 음독/훈독 칩
    └── empty_state.dart         # 빈 상태 표시
```

## 3. 데이터베이스 설계

### 3-1. ERD

```
kanji (2,136 rows)
├── id (PK, AUTO)
├── character (UNIQUE) ─────┐
├── onyomi                  │
├── kunyomi                 │
├── meanings (JSON)         │
├── strokeCount             │
├── jlptLevel (INDEX)       │
├── grade                   │
├── examples (JSON)         │
└── createdAt               │
                            │
favorites                   │
├── id (PK, AUTO)           │
├── kanjiId (UNIQUE, FK) ───┘
└── createdAt               │
                            │
study_progress              │
├── id (PK, AUTO)           │
├── kanjiId (UNIQUE, FK) ───┘
├── status (notStarted/learning/mastered)
└── updatedAt               │
                            │
quiz_item_stats             │
├── id (PK, AUTO)           │
├── kanjiId (FK) ───────────┘
├── quizType (UNIQUE with kanjiId)
├── quizCount, correctCount, incorrectCount
└── lastQuizzedAt, lastCorrectAt, lastIncorrectAt

quiz_results
├── id (PK, AUTO)
├── kanjiId (FK)
├── quizType, userAnswer, correctAnswer, isCorrect
└── createdAt (INDEX)

daily_goals
├── id (PK, AUTO)
├── date (UNIQUE, INDEX)
├── targetCount, studiedCount, quizCount, correctCount
└── createdAt, updatedAt

app_meta
├── key (PK)
├── value
└── updatedAt
```

### 3-2. 인덱스 전략

| 테이블 | 인덱스 | 용도 |
|--------|--------|------|
| kanji | `idx_kanji_jlpt` (jlptLevel) | 레벨별 목록 조회 |
| kanji | `idx_kanji_character` (character) | 한자 검색 |
| quiz_item_stats | `idx_quiz_stats_priority` (quizType, incorrectCount DESC) | 취약 한자 우선 출제 |
| quiz_results | `idx_quiz_results_created` (createdAt) | 오늘 퀴즈 통계 |
| daily_goals | `idx_daily_goals_date` (date) | 날짜별 목표 조회 |

## 4. 네비게이션 설계

### 4-1. 라우트 구조

```
GoRouter
├── /consent              → 약관 동의 (redirect 가드)
├── ShellRoute (하단 탭 4개)
│   ├── /                 → 홈 (대시보드)
│   ├── /kanji            → 한자 목록
│   ├── /quiz             → 퀴즈 메뉴
│   └── /settings         → 설정
│       ├── /terms        → 이용약관
│       ├── /privacy      → 개인정보처리방침
│       └── /about        → 앱 정보
├── /kanji/:id            → 한자 상세 (풀스크린, PageView 스와이프)
├── /quiz/config/:type    → 퀴즈 설정
├── /quiz/play/:type      → 퀴즈 플레이
└── /quiz/result          → 퀴즈 결과
```

### 4-2. 데이터 전달 방식

| 방식 | 사용처 | 예시 |
|------|--------|------|
| Path Parameter | 단일 ID | `/kanji/:id` |
| GoRouter extra | 복잡한 데이터 | kanjiIds 리스트, 퀴즈 설정 |
| Riverpod Provider | 전역 상태 | 선택된 JLPT 레벨, 검색어 |

## 5. 상태 관리 설계

### 5-1. Provider 매핑

```
                    ┌─ kanjiListProvider(level)      FutureProvider.family
kanjiRepository ────┼─ kanjiDetailProvider(id)       FutureProvider.family
                    ├─ kanjiSearchResultsProvider     FutureProvider
                    └─ kanjiCountPerLevelProvider     FutureProvider

                    ┌─ favoriteIdsProvider            StateNotifierProvider
favoriteRepository ─┤
                    └─ favoriteKanjiListProvider      FutureProvider

                    ┌─ studyProgressProvider          FutureProvider
progressRepository ─┤
                    └─ studyProgressByLevelProvider   FutureProvider.family

                    ┌─ quizSessionProvider            StateNotifierProvider
quizRepository ─────┤
                    └─ quizStatsProvider              FutureProvider

SharedPreferences ──┬─ themeModeProvider              StateNotifierProvider
                    ├─ dailyGoalTargetProvider        StateNotifierProvider
                    └─ consentProvider                StateNotifierProvider
```

### 5-2. 데이터 흐름

```
User Action → Provider.read() → Repository → SQLite
                   ↓
             Provider.invalidate()
                   ↓
          ref.watch() → UI 리빌드
```

## 6. UI/UX 설계

### 6-1. 디자인 시스템

| 토큰 | 값 | 용도 |
|------|-----|------|
| Primary | Teal #0D9488 | 주요 액션, 음독 표시 |
| N5 Color | Green | JLPT N5 배지 |
| N4 Color | Blue | JLPT N4 배지 |
| N3 Color | Purple | JLPT N3 배지 |
| N2 Color | Orange | JLPT N2 배지 |
| N1 Color | Red | JLPT N1 배지 |
| 음독 | Teal | 온요미 칩/텍스트 |
| 훈독 | Violet | 쿤요미 칩/텍스트 |

### 6-2. 주요 화면 와이어프레임

**홈 (대시보드)**
```
┌──────────────────────┐
│ 한자 학습        [🔍] │
├──────────────────────┤
│ ┌──────────────────┐ │
│ │ 학습 현황         │ │
│ │ 오늘퀴즈 | 정답 | 전체│
│ └──────────────────┘ │
│ ┌──────────────────┐ │
│ │ 학습 진도 ━━━━━░░ │ │
│ │ 완료 0  학습 0  미학습│
│ └──────────────────┘ │
│ [퀴즈] [즐겨찾기] [통계]│
│ JLPT N5  >  80 한자   │
│ JLPT N4  > 166 한자   │
│ ...                    │
├──────────────────────┤
│ [홈] [한자] [퀴즈] [설정]│
└──────────────────────┘
```

**한자 상세 (스와이프)**
```
┌──────────────────────┐
│ ← 漢     3/80    ♥  │ ← AppBar (고정)
├──────────────────────┤
│         漢           │ ← PageView (스와이프)
│    N3  15획  3학년    │
│                      │
│ 의미                  │
│ [한자] [한수]         │
│                      │
│ 읽기                  │
│ [음독 カン] [훈독 --]  │
│                      │
│ 예제                  │
│ 漢字 かんじ 한자      │
│                      │
│ 학습 상태             │
│ [미학습|학습중|완료]   │
│                      │
│ ← 스와이프 →          │
└──────────────────────┘
```

### 6-3. 테마 규칙

- `TextStyle`에 `color` 하드코딩 **금지**
- 모든 텍스트 색상은 `Theme.of(context).textTheme`에 의존
- 다크/라이트 자동 대응을 위한 필수 규칙

## 7. 빌드 & 배포

### 7-1. 서명

```
android/
├── app/upload-keystore.jks   (gitignored)
└── key.properties            (gitignored)
```

- `build.gradle.kts`에서 `key.properties` 읽어서 release signing config 적용

### 7-2. 빌드 명령

| 용도 | 명령 |
|------|------|
| 개발 | `flutter run -d chrome` |
| 테스트 APK | `flutter build apk --release` |
| Store AAB | `flutter build appbundle --release` |
| 코드 생성 | `dart run build_runner build --delete-conflicting-outputs` |
| 아이콘 생성 | `dart run flutter_launcher_icons` |

### 7-3. 랜딩페이지

```
landing/
├── index.html      → Vercel 배포 (kanjistudy-one.vercel.app)
├── terms.html      → 이용약관
├── privacy.html    → 개인정보처리방침
├── styles.css      → 반응형 다크 테마
└── vercel.json     → 라우팅 설정
```
