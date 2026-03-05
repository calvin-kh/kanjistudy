# KanjiStudy 기술 스터디 노트

## 목차
1. [앱 아키텍처 개요](#1-앱-아키텍처-개요)
2. [네비게이션 구조 - GoRouter + ShellRoute](#2-네비게이션-구조)
3. [상태관리 - Riverpod](#3-상태관리---riverpod)
4. [화면별 사용 위젯 & 기술 상세](#4-화면별-사용-위젯--기술-상세)
5. [레이아웃 패턴 정리](#5-레이아웃-패턴-정리)

---

## 1. 앱 아키텍처 개요

```
┌─────────────────────────────────────────────┐
│  GoRouter (라우팅)                           │
│  ├── /consent           → ConsentScreen     │
│  ├── ShellRoute         → MainScaffold      │
│  │   ├── /              → HomeScreen        │
│  │   ├── /kanji         → KanjiListScreen   │
│  │   ├── /search        → SearchScreen      │
│  │   ├── /favorites     → FavoritesScreen   │
│  │   ├── /quiz          → QuizMenuScreen    │
│  │   ├── /stats         → StatsScreen       │
│  │   └── /settings      → SettingsScreen    │
│  ├── /kanji/:id         → KanjiDetailScreen │ ← ShellRoute 밖 (풀스크린)
│  ├── /quiz/config/:type → QuizConfigScreen  │
│  ├── /quiz/play/:type   → QuizPlayScreen    │
│  └── /quiz/result       → QuizResultScreen  │
└─────────────────────────────────────────────┘
```

### 핵심 설계 원칙
- **완전 오프라인**: SQLite 로컬 DB, 서버/로그인 없음
- **Repository 패턴**: `DatabaseService(싱글톤)` → `Repository` → `Provider` → `Screen`
- **Freezed 모델**: 불변 데이터 클래스 + JSON 직렬화

---

## 2. 네비게이션 구조

### ShellRoute - 하단 탭 네비게이션

```dart
// ShellRoute는 공통 UI(하단 네비게이션바)를 유지하면서 자식 라우트의 화면만 교체
ShellRoute(
  builder: (context, state, child) => MainScaffold(child: child),
  routes: [ /* 탭 라우트들 */ ],
)
```

**왜 ShellRoute를 쓰는가?**
- 하단 `NavigationBar`를 모든 탭 화면에서 공유하기 위해
- `child`만 교체되므로 탭 바가 유지됨
- 상세 화면(`/kanji/:id`)은 ShellRoute **밖에** 배치 → 하단 탭 없이 풀스크린

### GoRouter의 redirect - 동의 화면 강제

```dart
redirect: (context, state) {
  if (!consentAccepted && !isConsentRoute) return '/consent';  // 미동의→동의화면
  if (consentAccepted && isConsentRoute) return '/';           // 동의완료→홈
  return null;                                                  // 그대로
},
```

**왜 redirect를 쓰는가?**
- 모든 라우트에 대해 일괄적으로 접근 제어 가능
- 각 화면마다 조건 분기를 넣을 필요 없음
- `consentProvider`가 변경되면 자동으로 재평가됨 (Riverpod `ref.watch`)

### context.push vs context.go

```dart
context.go('/kanji');           // 스택 교체 (탭 이동)
context.push('/kanji/${id}');   // 스택에 추가 (뒤로가기 가능)
context.pushReplacement(path);  // 현재 화면 교체 (퀴즈 결과)
```

### state.extra - 라우트 간 데이터 전달

```dart
// 보내기: push할 때 extra에 데이터를 실어보냄
context.push('/kanji/${kanji.id}', extra: kanjiIds);

// 받기: 라우터에서 state.extra로 꺼냄
final kanjiIds = state.extra as List<int>?;
```

**왜 extra를 쓰는가?**
- URL path parameter(`/kanji/:id`)는 단일 값만 전달 가능
- 리스트, 맵 등 복잡한 데이터는 `extra`로 전달
- 단점: 딥링크로는 복원 불가 (앱 내 네비게이션 전용)

---

## 3. 상태관리 - Riverpod

### Provider 종류별 사용 예시

```dart
// 1. Provider - 단순 읽기 전용 (싱글톤, 레포지토리)
final kanjiRepositoryProvider = Provider<KanjiRepository>((ref) { ... });

// 2. StateProvider - 단순 상태 값 (선택된 레벨, 검색어)
final selectedJlptLevelProvider = StateProvider<int>((ref) => 5);

// 3. FutureProvider - 비동기 데이터 로딩
final kanjiListProvider = FutureProvider.family<List<Kanji>, int>((ref, level) async { ... });
//    └── .family: 파라미터(level)에 따라 서로 다른 인스턴스 생성

// 4. StateNotifierProvider (또는 Notifier) - 복잡한 상태 변경 로직
final quizSessionProvider = StateNotifierProvider<QuizSessionNotifier, QuizSession?>((ref) { ... });
```

### AsyncValue.when 패턴

```dart
// FutureProvider의 결과를 UI에 반영하는 패턴
kanjiAsync.when(
  data: (kanji) => /* 데이터 있을 때 UI */,
  loading: () => /* 로딩 중 UI */,
  error: (e, _) => /* 에러 UI */,
);
```

**왜 이 패턴이 좋은가?**
- 로딩/에러/성공 3가지 상태를 강제로 처리하게 함
- null 체크 누락 방지
- 이 앱에서 거의 모든 화면이 이 패턴을 사용

### ref.watch vs ref.read

```dart
// watch: 값이 변하면 위젯이 다시 빌드됨 (build 메서드 안에서)
final kanjiList = ref.watch(kanjiListProvider(selectedLevel));

// read: 값만 읽고 리빌드 안 함 (이벤트 핸들러, 콜백 안에서)
ref.read(favoriteIdsProvider.notifier).toggle(kanji.id!);

// invalidate: 캐시를 강제 무효화 → 다시 fetch
ref.invalidate(studyProgressProvider);
```

---

## 4. 화면별 사용 위젯 & 기술 상세

### 4-1. MainScaffold (공통 탭 바)

| 요소 | 위젯 | 이유 |
|------|-------|------|
| 하단 탭 | `NavigationBar` | Material 3 디자인. `BottomNavigationBar`의 후속 |
| 현재 탭 감지 | `GoRouterState.of(context).matchedLocation` | URL 기반으로 선택된 탭 인덱스 계산 |
| 탭 이동 | `context.go()` | 탭 간 이동은 스택 교체 (push 아님) |

### 4-2. HomeScreen (대시보드)

| 요소 | 위젯 | 이유 |
|------|-------|------|
| 스크롤 | `ListView` | 화면보다 긴 콘텐츠를 자연스럽게 스크롤 |
| 학습 현황 카드 | `Card` + `Row` of `Expanded` | 3등분 균등 배치 |
| 진도 바 | `LinearProgressIndicator` | 간단한 수평 프로그레스 |
| 빠른 실행 | `Row` + `Expanded` + `InkWell` | 3개 버튼 균등 배치, 터치 피드백 |
| JLPT 레벨 목록 | `Card` + `ListTile` | 일관된 리스트 아이템 디자인 |

### 4-3. KanjiListScreen (한자 목록)

| 요소 | 위젯 | 이유 |
|------|-------|------|
| 레벨 탭 | 가로 `ListView` + `FilterChip` | 수평 스크롤 가능한 필터 칩. `TabBar` 대비 유연함 |
| 그리드 보기 | `GridView.builder` | 4열 그리드. `builder`로 필요한 만큼만 생성 (lazy) |
| 리스트 보기 | `ListView.separated` | 구분선 포함 리스트. `.separated`로 간격 자동 |
| 보기 전환 | `StateProvider<KanjiDisplayMode>` | grid/list 모드 토글 |

**GridView.builder 핵심 옵션:**
```dart
SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 4,       // 열 수
  crossAxisSpacing: 8,     // 가로 간격
  mainAxisSpacing: 8,      // 세로 간격
  childAspectRatio: 0.85,  // 카드 비율 (가로/세로)
)
```

### 4-4. KanjiGridCard (그리드 카드) - Stack + Positioned

```
┌─────────────┐
│         [♥] │ ← Positioned(top:4, right:4) - 레이아웃에 영향 없음
│     漢      │ ← Column의 중앙
│    한자     │
└─────────────┘
```

**기존 문제:**
```dart
// Column 안에 하트를 넣으면 → 하트 높이만큼 한자와 뜻이 밀려남
Column(children: [
  if (isFavorite) Align(..., child: Icon(♥)),  // ← 이게 공간을 차지
  Text('漢'),
  Text('한자'),
])
```

**해결: Stack + Positioned**
```dart
Stack(children: [
  // 1. 메인 콘텐츠 (항상 중앙)
  Padding(child: Center(child: Column(children: [Text('漢'), Text('한자')]))),
  // 2. 하트 오버레이 (레이아웃에 영향 없음)
  if (isFavorite) Positioned(top: 4, right: 4, child: Icon(♥)),
])
```

**왜 Stack을 쓰는가?**
- `Stack`은 자식들을 **겹쳐서** 배치
- `Positioned`로 위치를 지정한 자식은 다른 자식의 레이아웃에 **영향을 주지 않음**
- 조건부 표시(`if (isFavorite)`)되는 장식 요소에 적합

### 4-5. KanjiDetailScreen - PageView (스와이프 네비게이션)

#### 전체 구조

```
┌─────────────────────────┐
│ AppBar (고정)            │ ← Scaffold의 appBar (PageView 밖)
│  [漢]   [3/80]  [♥]     │    onPageChanged로 정보 갱신
├─────────────────────────┤
│                         │
│  PageView.builder ───── │ ← Scaffold의 body (스와이프 영역)
│  │                      │
│  ├─ Page 0: ListView    │    각 페이지는 독립적 ListView
│  ├─ Page 1: ListView    │    (세로 스크롤 가능)
│  ├─ Page 2: ListView    │
│  └─ ...                 │
│                         │
│  ← 스와이프하여 이전/다음 →│
└─────────────────────────┘
```

#### 핵심 코드 분석

**1단계: 위젯 구조 분리**
```dart
// 외부 (StatefulWidget) - AppBar + PageView 컨테이너
class KanjiDetailScreen extends ConsumerStatefulWidget {
  final int kanjiId;       // 선택한 한자 ID
  final List<int>? kanjiIds; // 전체 목록의 ID들 (nullable)
}

// 내부 (각 페이지 본문) - 한자 상세 콘텐츠
class _KanjiDetailBody extends ConsumerWidget {
  final int kanjiId;
}
```

**왜 분리하는가?**
- AppBar는 **고정**, 본문만 스와이프되어야 함
- AppBar를 PageView 안에 넣으면 → AppBar도 함께 넘어감 (부자연스러움)
- 분리하면 → `onPageChanged`에서 `setState`로 AppBar 정보만 갱신

**2단계: PageController**
```dart
late final PageController _pageController;
late int _currentIndex;
late final List<int> _ids;

@override
void initState() {
  super.initState();
  _ids = widget.kanjiIds ?? [widget.kanjiId]; // 목록 없으면 단일 항목
  _currentIndex = _ids.indexOf(widget.kanjiId); // 시작 위치 계산
  _pageController = PageController(initialPage: _currentIndex);
}
```

**왜 PageController가 필요한가?**
- `initialPage`: 첫 페이지를 0이 아닌 선택한 한자 위치로 설정
- 프로그래밍적으로 페이지 이동 가능 (`_pageController.animateToPage(...)`)
- 반드시 `dispose`에서 해제해야 메모리 누수 방지

**3단계: onPageChanged로 AppBar 동기화**
```dart
PageView.builder(
  onPageChanged: (index) {
    setState(() => _currentIndex = index); // 인덱스 갱신 → 리빌드
  },
  // ...
)

// AppBar에서 현재 인덱스의 한자 데이터를 watch
int get _currentKanjiId => _ids[_currentIndex];
final kanjiAsync = ref.watch(kanjiDetailProvider(_currentKanjiId));
```

**동작 흐름:**
1. 사용자가 스와이프 → `onPageChanged` 발동
2. `_currentIndex` 업데이트 → `setState` → build 재실행
3. `_currentKanjiId` 변경 → `ref.watch` 새 ID로 데이터 fetch
4. AppBar의 타이틀, 즐겨찾기 아이콘, 페이지 카운터 갱신

**4단계: ScrollPhysics 제어**
```dart
physics: _hasMultiple
    ? const AlwaysScrollableScrollPhysics()   // 목록 있으면 스와이프 허용
    : const NeverScrollableScrollPhysics(),    // 단일이면 스와이프 잠금
```

**왜 Physics를 제어하는가?**
- 단일 한자일 때 좌우 스와이프를 시도하면 → 바운스 효과만 나와서 어색
- `NeverScrollableScrollPhysics`로 완전히 잠금

**5단계: PageView 안의 ListView (중첩 스크롤)**
```dart
// 각 페이지 본문은 세로 스크롤 가능한 ListView
return ListView(
  padding: AppSpacing.screenPadding,
  children: [ /* 한자 상세 콘텐츠 */ ],
);
```

- `PageView`: **가로** 스크롤 (스와이프)
- 각 페이지의 `ListView`: **세로** 스크롤 (긴 콘텐츠)
- Flutter가 자동으로 스크롤 방향을 감지하여 충돌 없이 동작

### 4-6. ConsentScreen (동의 화면) - TabBar + TabBarView

| 요소 | 위젯 | 이유 |
|------|-------|------|
| 탭 | `TabBar` + `TabController` | 이용약관/개인정보 2개 탭 전환 |
| 탭 본문 | `TabBarView` | 탭에 연동된 페이지 스와이프 |
| 마크다운 렌더링 | `Markdown` (flutter_markdown) | .md 파일을 그대로 표시 |
| 파일 로드 | `rootBundle.loadString` | assets에서 텍스트 파일 읽기 |
| 하단 고정 버튼 | `Column` + `Expanded` + `Container` | TabBarView는 Expanded, 버튼은 하단 고정 |

```dart
// TabController 생성: SingleTickerProviderStateMixin 필요
class _ConsentScreenState extends ConsumerState<ConsentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // vsync: this → 애니메이션 타이머를 위젯 생명주기에 연결
}
```

**TabBarView vs PageView:**
- `TabBarView`는 `TabController`와 연동되어 탭 클릭 시 자동 페이지 전환
- `PageView`는 독립적 (탭 바 없이 스와이프만)
- 둘 다 내부적으로 `PageView`를 사용하지만, `TabBarView`는 탭과 자동 동기화

### 4-7. QuizPlayScreen - StatefulWidget 상태 머신

| 요소 | 위젯 | 이유 |
|------|-------|------|
| 진행률 | `AppBar.bottom` + `LinearProgressIndicator` | AppBar 하단에 붙은 진행 바 |
| 문제 영역 | `Spacer` + `Text` + `Spacer` | 세로 중앙 정렬 |
| 보기 버튼 | `OutlinedButton` + 조건부 스타일 | 정답/오답에 따라 색상 변경 |
| 상태 관리 | `_answered`, `_selectedAnswer` | 로컬 StatefulWidget 상태로 퀴즈 흐름 제어 |

**Spacer 패턴:**
```dart
Column(children: [
  const Spacer(),       // 위쪽 빈 공간
  Text(question),       // 문제 (세로 중앙)
  const Spacer(),       // 아래쪽 빈 공간
  ...options,           // 보기 버튼들 (하단)
])
```

### 4-8. QuizConfigScreen - ChoiceChip

| 요소 | 위젯 | 이유 |
|------|-------|------|
| 레벨 선택 | `Wrap` + `ChoiceChip` | 단일 선택 칩. 줄바꿈 자동 |
| 문제 수 | `Wrap` + `ChoiceChip` | 동일 패턴 재사용 |
| 시작 버튼 | `ElevatedButton.icon` | 아이콘(▶) + 텍스트 조합 |

**ChoiceChip vs FilterChip:**
- `ChoiceChip`: 단일 선택 (라디오 버튼처럼)
- `FilterChip`: 다중 선택 (체크박스처럼)

### 4-9. SettingsScreen - Dialog 패턴들

```dart
// 1. SimpleDialog - 단순 목록 선택
showDialog(
  builder: (_) => SimpleDialog(
    title: Text('테마 선택'),
    children: [RadioListTile(...)],
  ),
);

// 2. AlertDialog - 확인/취소 액션
showDialog(
  builder: (_) => AlertDialog(
    title: Text('데이터 초기화'),
    content: Text('되돌릴 수 없습니다'),
    actions: [TextButton('취소'), TextButton('초기화')],
  ),
);
```

### 4-10. StatsScreen - 레벨별 진도

| 요소 | 위젯 | 이유 |
|------|-------|------|
| 전체 통계 | `Row` of `Expanded` | 3등분 균등 배치 |
| 레벨별 진도 | `Card` + `LinearProgressIndicator` | 각 JLPT 레벨마다 프로그레스 바 |
| 레벨 색상 | `AppColors.jlptColor(level)` | N5=Green, N4=Blue 등 레벨별 고유 색상 |

---

## 5. 레이아웃 패턴 정리

### 균등 분할: Row + Expanded

```dart
Row(children: [
  Expanded(child: widget1),  // 1/3
  Expanded(child: widget2),  // 1/3
  Expanded(child: widget3),  // 1/3
])
```

### 비균등 분할: Expanded flex

```dart
Row(children: [
  Expanded(flex: 1, child: cancelBtn),   // 1/3
  Expanded(flex: 2, child: confirmBtn),  // 2/3
])
```

### 겹치기: Stack + Positioned

```dart
Stack(children: [
  mainContent,                                    // 기본 레이어
  Positioned(top: 0, right: 0, child: badge),    // 오버레이
])
```

### 중앙 정렬: Spacer

```dart
Column(children: [
  Spacer(),        // 탄력적 빈 공간
  centerContent,   // 중앙에 위치
  Spacer(),        // 탄력적 빈 공간
])
```

### 가로 스크롤 칩: ListView(horizontal) + Chip

```dart
SizedBox(
  height: 48,  // 고정 높이 필요
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: chips,
  ),
)
```

### 줄바꿈 칩: Wrap

```dart
Wrap(
  spacing: 8,       // 가로 간격
  runSpacing: 8,    // 줄 간 간격
  children: chips,  // 공간 부족하면 자동 줄바꿈
)
```

### 하단 고정: Column + Expanded

```dart
Column(children: [
  Expanded(child: scrollableContent),  // 나머지 공간 차지
  Container(child: fixedBottomBar),    // 하단 고정
])
```
