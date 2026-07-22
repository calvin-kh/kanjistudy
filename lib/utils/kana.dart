/// 가나(仮名) 표기 변환 유틸리티.
///
/// 음독은 원본 데이터(assets/data/*.json, SQLite `kanji.onyomi`)에 카타카나로
/// 저장되어 있다. 앱에서는 후리가나(히라가나) 표기로 보여주기 위해
/// [KanjiRepository._fromRow] 한 곳에서 [toHiragana]로 변환한다.
/// DB 원본은 카타카나 그대로 두므로 표기 방식을 되돌리거나
/// 설정 토글로 확장할 때 마이그레이션이 필요 없다.
class Kana {
  Kana._();

  /// 카타카나 블록 ァ(U+30A1) ~ ヶ(U+30F6)
  static const int _kataStart = 0x30A1;
  static const int _kataEnd = 0x30F6;

  /// 히라가나 블록 ぁ(U+3041) ~ ゖ(U+3096)
  static const int _hiraStart = 0x3041;
  static const int _hiraEnd = 0x3096;

  /// 두 블록 사이의 코드포인트 간격
  static const int _offset = 0x60;

  /// 반복 기호: ヽ(U+30FD) ヾ(U+30FE) <-> ゝ(U+309D) ゞ(U+309E)
  static const int _kataIterStart = 0x30FD;
  static const int _kataIterEnd = 0x30FE;
  static const int _hiraIterStart = 0x309D;
  static const int _hiraIterEnd = 0x309E;

  /// 카타카나를 히라가나로 변환한다.
  ///
  /// 장음부호 ー(U+30FC), 구분자 、(U+3001), ヷヸヹヺ(대응 히라가나 없음)는
  /// 그대로 보존한다.
  static String toHiragana(String input) {
    if (input.isEmpty) return input;

    final buffer = StringBuffer();
    for (final rune in input.runes) {
      if (rune >= _kataStart && rune <= _kataEnd) {
        buffer.writeCharCode(rune - _offset);
      } else if (rune >= _kataIterStart && rune <= _kataIterEnd) {
        buffer.writeCharCode(rune - _offset);
      } else {
        buffer.writeCharCode(rune);
      }
    }
    return buffer.toString();
  }

  /// 히라가나를 카타카나로 변환한다.
  ///
  /// 검색어를 DB에 저장된 카타카나 음독과 대조할 때 사용한다.
  static String toKatakana(String input) {
    if (input.isEmpty) return input;

    final buffer = StringBuffer();
    for (final rune in input.runes) {
      if (rune >= _hiraStart && rune <= _hiraEnd) {
        buffer.writeCharCode(rune + _offset);
      } else if (rune >= _hiraIterStart && rune <= _hiraIterEnd) {
        buffer.writeCharCode(rune + _offset);
      } else {
        buffer.writeCharCode(rune);
      }
    }
    return buffer.toString();
  }

  /// 문자열에 카타카나가 하나라도 포함되어 있는지 확인한다.
  static bool hasKatakana(String input) => input.runes.any(
    (r) => (r >= _kataStart && r <= _kataEnd) ||
        (r >= _kataIterStart && r <= _kataIterEnd),
  );

  /// 문자열에 히라가나가 하나라도 포함되어 있는지 확인한다.
  static bool hasHiragana(String input) => input.runes.any(
    (r) => (r >= _hiraStart && r <= _hiraEnd) ||
        (r >= _hiraIterStart && r <= _hiraIterEnd),
  );
}
