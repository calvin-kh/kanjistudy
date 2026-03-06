import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/color_scheme.dart';
import '../../config/typography.dart';
import '../../config/spacing.dart';
import '../../providers/kanji_provider.dart';
import '../../providers/favorite_provider.dart';
import '../../providers/stats_provider.dart';
import '../../models/study_progress.dart';
import '../../widgets/jlpt_badge.dart';
import '../../widgets/reading_chip.dart';

class KanjiDetailScreen extends ConsumerStatefulWidget {
  final int kanjiId;
  final List<int>? kanjiIds;

  const KanjiDetailScreen({
    super.key,
    required this.kanjiId,
    this.kanjiIds,
  });

  @override
  ConsumerState<KanjiDetailScreen> createState() => _KanjiDetailScreenState();
}

class _KanjiDetailScreenState extends ConsumerState<KanjiDetailScreen> {
  late final PageController _pageController;
  late int _currentIndex;
  late final List<int> _ids;

  @override
  void initState() {
    super.initState();
    _ids = widget.kanjiIds ?? [widget.kanjiId];
    _currentIndex = _ids.indexOf(widget.kanjiId);
    if (_currentIndex < 0) _currentIndex = 0;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int get _currentKanjiId => _ids[_currentIndex];
  bool get _hasMultiple => _ids.length > 1;

  @override
  Widget build(BuildContext context) {
    final kanjiAsync = ref.watch(kanjiDetailProvider(_currentKanjiId));
    final favoriteIds = ref.watch(favoriteIdsProvider);

    return Scaffold(
      appBar: AppBar(
        title: kanjiAsync.when(
          data: (kanji) => Text(kanji?.character ?? ''),
          loading: () => const Text(''),
          error: (_, __) => const Text(''),
        ),
        actions: [
          if (_hasMultiple)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: AppSpacing.sm),
                child: Text(
                  '${_currentIndex + 1} / ${_ids.length}',
                  style: AppTypography.caption,
                ),
              ),
            ),
          kanjiAsync.when(
            data: (kanji) {
              if (kanji == null) return const SizedBox.shrink();
              final isFavorite = favoriteIds.contains(kanji.id);
              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? AppColors.error : null,
                ),
                onPressed: () {
                  ref.read(favoriteIdsProvider.notifier).toggle(kanji.id!);
                },
              );
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _ids.length,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        physics: _hasMultiple
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _KanjiDetailBody(
            kanjiId: _ids[index],
            showSwipeHint: _hasMultiple,
          );
        },
      ),
    );
  }
}

class _KanjiDetailBody extends ConsumerWidget {
  final int kanjiId;
  final bool showSwipeHint;

  const _KanjiDetailBody({
    required this.kanjiId,
    required this.showSwipeHint,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kanjiAsync = ref.watch(kanjiDetailProvider(kanjiId));

    return kanjiAsync.when(
      data: (kanji) {
        if (kanji == null) {
          return const Center(child: Text('한자를 찾을 수 없습니다'));
        }

        return ListView(
          padding: AppSpacing.screenPadding,
          children: [
            // Kanji Hero
            Center(
              child: Column(
                children: [
                  Text(kanji.character, style: AppTypography.kanjiHero),
                  AppSpacing.gapSm,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      JlptBadge(level: kanji.jlptLevel, fontSize: 14),
                      if (kanji.strokeCount != null) ...[
                        AppSpacing.gapHMd,
                        Text(
                          '${kanji.strokeCount}획',
                          style: AppTypography.bodyMedium,
                        ),
                      ],
                      if (kanji.grade != null) ...[
                        AppSpacing.gapHMd,
                        Text(
                          '${kanji.grade}학년',
                          style: AppTypography.bodyMedium,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),

            AppSpacing.gapXl,

            // Meanings
            Text('의미', style: AppTypography.headlineMedium),
            AppSpacing.gapSm,
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: kanji.meanings.map((m) {
                return Chip(label: Text(m));
              }).toList(),
            ),

            AppSpacing.gapXl,

            // Readings
            Text('읽기', style: AppTypography.headlineMedium),
            AppSpacing.gapSm,
            Row(
              children: [
                if (kanji.onyomi != null && kanji.onyomi!.isNotEmpty)
                  Expanded(
                    child: ReadingChip(
                      label: '음독 (おんよみ)',
                      reading: kanji.onyomi!,
                      isOnyomi: true,
                    ),
                  ),
                if (kanji.onyomi != null && kanji.kunyomi != null &&
                    kanji.onyomi!.isNotEmpty && kanji.kunyomi!.isNotEmpty)
                  AppSpacing.gapHMd,
                if (kanji.kunyomi != null && kanji.kunyomi!.isNotEmpty)
                  Expanded(
                    child: ReadingChip(
                      label: '훈독 (くんよみ)',
                      reading: kanji.kunyomi!,
                      isOnyomi: false,
                    ),
                  ),
              ],
            ),

            // Examples
            if (kanji.examples.isNotEmpty) ...[
              AppSpacing.gapXl,
              Text('예제', style: AppTypography.headlineMedium),
              AppSpacing.gapSm,
              ...kanji.examples.map((ex) {
                return Card(
                  child: ListTile(
                    title: Text(ex.word, style: AppTypography.exampleJapanese),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (ex.reading != null)
                          Text(ex.reading!, style: AppTypography.onyomi.copyWith(fontSize: 14)),
                        if (ex.meaning != null)
                          Text(ex.meaning!, style: AppTypography.bodyMedium),
                      ],
                    ),
                  ),
                );
              }),
            ],

            // Study Status
            AppSpacing.gapXl,
            Text('학습 상태', style: AppTypography.headlineMedium),
            AppSpacing.gapSm,
            _StudyStatusButtons(kanjiId: kanji.id!),

            if (showSwipeHint) ...[
              AppSpacing.gapXl,
              Center(
                child: Text(
                  '← 스와이프하여 이전/다음 한자 →',
                  style: AppTypography.caption,
                ),
              ),
            ],

            AppSpacing.gapXxl,
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('오류: $e')),
    );
  }
}

class _StudyStatusButtons extends ConsumerStatefulWidget {
  final int kanjiId;

  const _StudyStatusButtons({required this.kanjiId});

  @override
  ConsumerState<_StudyStatusButtons> createState() => _StudyStatusButtonsState();
}

class _StudyStatusButtonsState extends ConsumerState<_StudyStatusButtons> {
  StudyStatus? _currentStatus;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadStatus();
  }

  Future<void> _loadStatus() async {
    final repo = ref.read(progressRepositoryProvider);
    final status = await repo.getStatus(widget.kanjiId);
    if (mounted) {
      setState(() {
        _currentStatus = status;
        _loading = false;
      });
    }
  }

  Future<void> _updateStatus(StudyStatus status) async {
    final repo = ref.read(progressRepositoryProvider);
    await repo.updateStatus(widget.kanjiId, status);
    if (mounted) {
      setState(() => _currentStatus = status);
    }
    // Refresh progress stats
    ref.invalidate(studyProgressProvider);
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());

    return SegmentedButton<StudyStatus>(
      segments: const [
        ButtonSegment(
          value: StudyStatus.notStarted,
          label: Text('미학습'),
          icon: Icon(Icons.circle_outlined),
        ),
        ButtonSegment(
          value: StudyStatus.learning,
          label: Text('학습중'),
          icon: Icon(Icons.auto_stories),
        ),
        ButtonSegment(
          value: StudyStatus.mastered,
          label: Text('완료'),
          icon: Icon(Icons.check_circle),
        ),
      ],
      selected: {_currentStatus ?? StudyStatus.notStarted},
      onSelectionChanged: (newSelection) {
        _updateStatus(newSelection.first);
      },
    );
  }
}
