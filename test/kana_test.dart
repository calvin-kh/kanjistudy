import 'package:flutter_test/flutter_test.dart';
import 'package:kanji_study/utils/kana.dart';

void main() {
  group('Kana.toHiragana', () {
    test('실제 음독 데이터를 후리가나로 변환한다', () {
      // assets/data/kanji_n5.json 의 실제 값들
      expect(Kana.toHiragana('イチ、イツ'), 'いち、いつ');
      expect(Kana.toHiragana('ニ'), 'に');
      expect(Kana.toHiragana('サン'), 'さん');
      expect(Kana.toHiragana('シ'), 'し');
    });

    test('구분자와 장음부호를 보존한다', () {
      // 、(U+3001) 는 카타카나 블록 밖이므로 그대로 유지
      expect(Kana.toHiragana('コウ、ギョウ、アン'), 'こう、ぎょう、あん');
      // ー(U+30FC) 장음부호는 히라가나 표기에서도 그대로 쓴다
      expect(Kana.toHiragana('ラーメン'), 'らーめん');
    });

    test('탁음, 반탁음, 요음, 촉음을 변환한다', () {
      expect(Kana.toHiragana('ガ'), 'が');
      expect(Kana.toHiragana('パ'), 'ぱ');
      expect(Kana.toHiragana('キョ'), 'きょ');
      expect(Kana.toHiragana('ガッコウ'), 'がっこう');
      expect(Kana.toHiragana('ン'), 'ん');
      expect(Kana.toHiragana('ヴ'), 'ゔ');
    });

    test('히라가나와 한자는 그대로 통과시킨다', () {
      expect(Kana.toHiragana('ひと、ひと.つ'), 'ひと、ひと.つ');
      expect(Kana.toHiragana('漢字'), '漢字');
      expect(Kana.toHiragana(''), '');
    });
  });

  group('Kana.toKatakana', () {
    test('검색어를 DB 저장 표기(카타카나)로 되돌린다', () {
      expect(Kana.toKatakana('いち'), 'イチ');
      expect(Kana.toKatakana('がっこう'), 'ガッコウ');
      expect(Kana.toKatakana('ん'), 'ン');
    });

    test('카타카나와 한자는 그대로 통과시킨다', () {
      expect(Kana.toKatakana('イチ'), 'イチ');
      expect(Kana.toKatakana('漢字'), '漢字');
    });
  });

  group('왕복 변환', () {
    test('카타카나 -> 히라가나 -> 카타카나는 원본과 같다', () {
      for (final original in ['イチ、イツ', 'ガッコウ', 'キョウ', 'ジョウ、セイ']) {
        expect(Kana.toKatakana(Kana.toHiragana(original)), original);
      }
    });
  });

  group('판별 헬퍼', () {
    test('hasKatakana / hasHiragana', () {
      expect(Kana.hasKatakana('イチ'), isTrue);
      expect(Kana.hasKatakana('いち'), isFalse);
      expect(Kana.hasHiragana('いち'), isTrue);
      expect(Kana.hasHiragana('イチ'), isFalse);
      expect(Kana.hasKatakana('漢字'), isFalse);
      expect(Kana.hasHiragana('漢字'), isFalse);
    });
  });
}
