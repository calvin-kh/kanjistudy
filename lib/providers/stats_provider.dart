import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/database_service.dart';
import '../repositories/progress_repository.dart';
import '../repositories/quiz_repository.dart';
import '../models/study_progress.dart';

final progressRepositoryProvider = Provider<ProgressRepository>((ref) {
  return ProgressRepository(DatabaseService.instance);
});

/// Overall study progress counts
final studyProgressProvider = FutureProvider<Map<StudyStatus, int>>((ref) async {
  final repo = ref.watch(progressRepositoryProvider);
  return repo.getCountByStatus();
});

/// Study progress by level
final studyProgressByLevelProvider =
    FutureProvider.family<Map<StudyStatus, int>, int>((ref, level) async {
  final repo = ref.watch(progressRepositoryProvider);
  return repo.getCountByStatus(jlptLevel: level);
});

/// Quiz stats
final quizStatsProvider = FutureProvider<Map<String, int>>((ref) async {
  final repo = QuizRepository(DatabaseService.instance);
  final total = await repo.getTotalQuizCount();
  final correct = await repo.getTotalCorrectCount();
  final todayTotal = await repo.getTodayQuizCount();
  final todayCorrect = await repo.getTodayCorrectCount();

  return {
    'total': total,
    'correct': correct,
    'todayTotal': todayTotal,
    'todayCorrect': todayCorrect,
  };
});
