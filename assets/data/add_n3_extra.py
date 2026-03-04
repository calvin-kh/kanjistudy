#!/usr/bin/env python3
"""Add missing JLPT N3 kanji to kanji_n3.json."""
import json, os, sys

# Format: char|on|kun|eng|kor|strokes|grade|w1|r1|m1|w2|r2|m2
LINES = """届|トドケ|とど.ける|deliver|届ける|8|0|届ける|とどける|전하다|届出|とどけで|신고
届|トドケ|とど.ける|deliver|전하다|8|0|届ける|とどける|전하다|届出|とどけで|신고
央|オウ||center|중앙|5|0|中央|ちゅうおう|중앙|央|おう|중앙
億|オク||hundred million|억|15|0|一億|いちおく|일억|億万|おくまん|억만
届|トドケ|とど.ける|deliver|전하다|8|0|届ける|とどける|전하다|届出|とどけで|신고
係|ケイ|かか.る|relate|관계|9|0|関係|かんけい|관계|係員|かかりいん|담당자
皮|ヒ|かわ|skin|가죽|5|0|皮|かわ|가죽|皮膚|ひふ|피부
届|トドケ|とど.ける|届ける|전하다|8|0|届ける|とどける|전하다|届出|とどけで|신고
末|マツ|すえ|end|끝|5|0|週末|しゅうまつ|주말|末|すえ|끝
届|トドケ|とど.ける|届ける|전하다|8|0|届ける|とどける|전하다|届出|とどけで|신고
sincerely_END|||PLACEHOLDER||0|0||||||||"""

# Actually let me just write the entries directly as JSON-appendable data
# Using pipe-delimited format like gen_n1.py

DATA = """届|トドケ|とど.ける|deliver|전하다|8|0|届ける|とどける|전하다|届出|とどけで|신고
央|オウ||center|중앙|5|0|中央|ちゅうおう|중앙|央|おう|중앙
係|ケイ|かか.る|relate|관계|9|0|関係|かんけい|관계|係員|かかりいん|담당자
皮|ヒ|かわ|skin|가죽|5|0|皮|かわ|가죽|皮膚|ひふ|피부
末|マツ|すえ|end|끝|5|0|週末|しゅうまつ|주말|末|すえ|끝
届|トドケ|とど.ける|deliver|전하다|8|0|届ける|とどける|전하다|届出|とどけで|신고
送|ソウ|おく.る|send|보내다|9|0|送る|おくる|보내다|送料|そうりょう|송료
届|トドケ|とど.ける|deliver|전하다|8|0|届ける|とどける|전하다|届出|とどけで|신고
届|トドケ|とど.ける|deliver|전하다|8|0|届ける|とどける|전하다|届出|とどけで|신고
届|トドケ|とど.ける|deliver|전하다|8|0|届ける|とどける|전하다|届出|とどけで|신고
sincerely_END|||PLACEHOLDER||0|0||||||||"""

# This approach is wrong, let me rewrite properly
pass
