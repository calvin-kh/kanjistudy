/// KanjiStudy SQLite Schema (no userId, fully local)
class DatabaseSchema {
  static const int version = 1;
  static const String dbName = 'kanji_study.db';

  static List<String> get createTableStatements => [
    createKanjiTable,
    createFavoritesTable,
    createStudyProgressTable,
    createQuizItemStatsTable,
    createQuizResultsTable,
    createDailyGoalsTable,
    createAppMetaTable,
  ];

  /// 한자 마스터 데이터
  static const String createKanjiTable = '''
    CREATE TABLE IF NOT EXISTS kanji (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      character TEXT NOT NULL UNIQUE,
      onyomi TEXT,
      kunyomi TEXT,
      meanings TEXT NOT NULL,
      strokeCount INTEGER,
      jlptLevel INTEGER NOT NULL,
      grade INTEGER,
      examples TEXT,
      createdAt TEXT
    )
  ''';

  /// 즐겨찾기
  static const String createFavoritesTable = '''
    CREATE TABLE IF NOT EXISTS favorites (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      kanjiId INTEGER NOT NULL UNIQUE,
      createdAt TEXT,
      FOREIGN KEY (kanjiId) REFERENCES kanji(id) ON DELETE CASCADE
    )
  ''';

  /// 학습 진도
  static const String createStudyProgressTable = '''
    CREATE TABLE IF NOT EXISTS study_progress (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      kanjiId INTEGER NOT NULL UNIQUE,
      status TEXT NOT NULL DEFAULT 'notStarted',
      updatedAt TEXT,
      FOREIGN KEY (kanjiId) REFERENCES kanji(id) ON DELETE CASCADE
    )
  ''';

  /// 퀴즈 아이템 통계
  static const String createQuizItemStatsTable = '''
    CREATE TABLE IF NOT EXISTS quiz_item_stats (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      kanjiId INTEGER NOT NULL,
      quizType TEXT NOT NULL,
      quizCount INTEGER DEFAULT 0,
      correctCount INTEGER DEFAULT 0,
      incorrectCount INTEGER DEFAULT 0,
      lastQuizzedAt TEXT,
      lastCorrectAt TEXT,
      lastIncorrectAt TEXT,
      createdAt TEXT,
      updatedAt TEXT,
      UNIQUE(kanjiId, quizType)
    )
  ''';

  /// 퀴즈 결과 기록
  static const String createQuizResultsTable = '''
    CREATE TABLE IF NOT EXISTS quiz_results (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      kanjiId INTEGER NOT NULL,
      quizType TEXT NOT NULL,
      userAnswer TEXT,
      correctAnswer TEXT,
      isCorrect INTEGER NOT NULL,
      createdAt TEXT
    )
  ''';

  /// 일일 학습 목표
  static const String createDailyGoalsTable = '''
    CREATE TABLE IF NOT EXISTS daily_goals (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      date TEXT NOT NULL UNIQUE,
      targetCount INTEGER NOT NULL DEFAULT 10,
      studiedCount INTEGER NOT NULL DEFAULT 0,
      quizCount INTEGER NOT NULL DEFAULT 0,
      correctCount INTEGER NOT NULL DEFAULT 0,
      createdAt TEXT,
      updatedAt TEXT
    )
  ''';

  /// 앱 메타데이터
  static const String createAppMetaTable = '''
    CREATE TABLE IF NOT EXISTS app_meta (
      key TEXT PRIMARY KEY,
      value TEXT,
      updatedAt TEXT
    )
  ''';

  // ─── Indexes ───

  static const String createKanjiIndexes = '''
    CREATE INDEX IF NOT EXISTS idx_kanji_jlpt ON kanji(jlptLevel);
    CREATE INDEX IF NOT EXISTS idx_kanji_character ON kanji(character)
  ''';

  static const String createQuizStatsIndexes = '''
    CREATE INDEX IF NOT EXISTS idx_quiz_stats_kanji ON quiz_item_stats(kanjiId);
    CREATE INDEX IF NOT EXISTS idx_quiz_stats_priority ON quiz_item_stats(quizType, incorrectCount DESC, quizCount, lastQuizzedAt)
  ''';

  static const String createQuizResultsIndexes = '''
    CREATE INDEX IF NOT EXISTS idx_quiz_results_created ON quiz_results(createdAt);
    CREATE INDEX IF NOT EXISTS idx_quiz_results_kanji ON quiz_results(kanjiId)
  ''';

  static const String createDailyGoalsIndexes = '''
    CREATE INDEX IF NOT EXISTS idx_daily_goals_date ON daily_goals(date)
  ''';

  static List<String> get createIndexStatements => [
    createKanjiIndexes,
    createQuizStatsIndexes,
    createQuizResultsIndexes,
    createDailyGoalsIndexes,
  ];
}
