#!/usr/bin/env python3
"""Final N2 batch - add remaining kanji to reach ~370."""
import json, os, sys

LINES = """嘆|タン|なげ.く|lament|탄식|13|0|嘆く|なげく|탄식하다|感嘆|かんたん|감탄
胆|タン|きも|gallbladder|쓸개|9|0|大胆|だいたん|대담|胆力|たんりょく|담력
鶴|カク|つる|crane|학|21|0|鶴|つる|학|折り鶴|おりづる|종이학
亀|キ|かめ|turtle|거북이|11|0|亀|かめ|거북이|亀裂|きれつ|균열
鯨|ゲイ|くじら|whale|고래|19|0|鯨|くじら|고래|捕鯨|ほげい|포경
鯉|リ|こい|carp|잉어|18|0|鯉|こい|잉어|鯉のぼり|こいのぼり|잉어깃발
鳩|キュウ|はと|pigeon|비둘기|13|0|鳩|はと|비둘기|伝書鳩|でんしょばと|전서구
鳶|エン|とび|kite|솔개|14|0|鳶|とび|솔개|鳶職|とびしょく|높은곳작업
鮮|セン|あざ.やか|fresh|선명|17|0|新鮮|しんせん|신선|鮮やか|あざやか|선명한
鍵|ケン|かぎ|key|열쇠|17|0|鍵|かぎ|열쇠|鍵盤|けんばん|건반
鎌|レン|かま|sickle|낫|18|0|鎌|かま|낫|鎌倉|かまくら|가마쿠라
鉛|エン|なまり|lead|납|13|0|鉛|なまり|납|鉛筆|えんぴつ|연필
鉢|ハチ||bowl|그릇|13|0|鉢|はち|그릇|植木鉢|うえきばち|화분
釘|テイ|くぎ|nail|못|10|0|釘|くぎ|못|釘付け|くぎづけ|못박음
酔|スイ|よ.う|drunk|취하다|11|0|酔う|よう|취하다|酔っ払い|よっぱらい|술취한사람
酵|コウ||ferment|발효|14|0|発酵|はっこう|발효|酵素|こうそ|효소
郷|キョウ|さと|hometown|고향|11|0|故郷|こきょう|고향|郷愁|きょうしゅう|향수
遅|チ|おく.れる|late|늦다|12|0|遅れる|おくれる|늦다|遅刻|ちこく|지각
遠|エン|とお.い|far|멀다|13|0|遠い|とおい|멀다|遠慮|えんりょ|사양
避|ヒ|さ.ける|avoid|피하다|16|0|避ける|さける|피하다|回避|かいひ|회피
邸|テイ||mansion|저택|8|0|邸宅|ていたく|저택|公邸|こうてい|공저
遂|スイ|と.げる|achieve|이루다|12|0|遂げる|とげる|이루다|完遂|かんすい|완수
逆|ギャク|さか|reverse|반대|9|0|逆|ぎゃく|반대|逆転|ぎゃくてん|역전
透|トウ|す.く|transparent|투명|10|0|透明|とうめい|투명|透ける|すける|비치다
辣|ラツ||pungent|매울|14|0|辛辣|しんらつ|신랄|辣腕|らつわん|민완
辻|シン|つじ|crossroad|사거리|5|0|辻|つじ|사거리|辻褄|つじつま|앞뒤
迂|ウ||detour|에돌다|6|0|迂回|うかい|우회|迂闊|うかつ|부주의
逐|チク||pursue|쫓다|10|0|逐一|ちくいち|하나하나|駆逐|くちく|구축
逓|テイ||relay|체신|10|0|逓信|ていしん|체신|逓減|ていげん|체감
遮|シャ|さえぎ.る|intercept|가리다|14|0|遮断|しゃだん|차단|遮る|さえぎる|가리다
郭|カク||enclosure|곽|11|0|外郭|がいかく|외곽|輪郭|りんかく|윤곽
鋳|チュウ|い.る|cast|주조|15|0|鋳物|いもの|주물|鋳造|ちゅうぞう|주조
錦|キン|にしき|brocade|비단|16|0|錦|にしき|비단|錦秋|きんしゅう|금추
錬|レン|ね.る|forge|단련|16|0|鍛錬|たんれん|단련|洗錬|せんれん|세련
閑|カン||leisure|한가|12|0|閑静|かんせい|한적|閑暇|かんか|한가
闘|トウ|たたか.う|battle|싸우다|18|0|戦闘|せんとう|전투|闘志|とうし|투지
雇|コ|やと.う|hire|고용|12|0|雇用|こよう|고용|雇い主|やといぬし|고용주
雑|ザツ||miscellaneous|잡|14|0|雑誌|ざっし|잡지|複雑|ふくざつ|복잡
雰|フン||atmosphere|분위기|12|0|雰囲気|ふんいき|분위기|雰囲|ふんい|분위
需|ジュ||demand|수요|14|0|需要|じゅよう|수요|必需品|ひつじゅひん|필수품
震|シン|ふる.う|quake|지진|15|0|地震|じしん|지진|震動|しんどう|진동
霊|レイ|たま|spirit|영혼|15|0|霊|れい|영혼|幽霊|ゆうれい|유령
韻|イン||rhyme|운|19|0|韻|いん|운|脚韻|きゃくいん|각운
頂|チョウ|いただ.く|summit|꼭대기|11|0|頂上|ちょうじょう|정상|頂く|いただく|받다
頻|ヒン|しき.りに|frequent|빈번|17|0|頻繁|ひんぱん|빈번|頻度|ひんど|빈도
飽|ホウ|あ.きる|satiate|질리다|13|0|飽きる|あきる|질리다|飽和|ほうわ|포화
飼|シ|か.う|raise|기르다|13|0|飼う|かう|기르다|飼育|しいく|사육
餅|ヘイ|もち|rice cake|떡|15|0|餅|もち|떡|餅つき|もちつき|떡치기
駒|ク|こま|colt|말|15|0|駒|こま|말|将棋の駒|しょうぎのこま|장기말
騙|ヘン|だま.す|deceive|속이다|18|0|騙す|だます|속이다|詐騙|さへん|사기
鬱|ウツ||melancholy|우울|29|0|鬱|うつ|우울|憂鬱|ゆううつ|우울
髪|ハツ|かみ|hair|머리카락|14|0|髪|かみ|머리카락|髪型|かみがた|헤어스타일
鶏|ケイ|にわとり|chicken|닭|19|0|鶏|にわとり|닭|鶏肉|とりにく|닭고기
麓|ロク|ふもと|foot of mt|산기슭|19|0|麓|ふもと|산기슭|山麓|さんろく|산록
齊|セイ||equal|가지런|14|0|一斉|いっせい|일제|斉一|せいいつ|제일
sincerely_END|||PLACEHOLDER||0|0||||||||"""

def parse():
    entries = []
    seen = set()
    for line in LINES.strip().split("\n"):
        parts = line.split("|")
        if parts[0].startswith("sincerely"):
            continue
        if len(parts) < 13:
            continue
        char = parts[0]
        if char in seen:
            continue
        seen.add(char)
        on, kun, eng, kor = parts[1], parts[2], parts[3], parts[4]
        strokes, grade = int(parts[5]), int(parts[6])
        w1, r1, m1 = parts[7], parts[8], parts[9]
        w2, r2, m2 = parts[10], parts[11], parts[12]
        entries.append({
            "character": char,
            "onyomi": on,
            "kunyomi": kun,
            "meanings": [eng, kor],
            "strokeCount": strokes,
            "grade": grade,
            "examples": [
                {"word": w1, "reading": r1, "meaning": m1},
                {"word": w2, "reading": r2, "meaning": m2}
            ]
        })
    return entries

if __name__ == "__main__":
    sys.stdout.reconfigure(encoding='utf-8')
    new_data = parse()
    script_dir = os.path.dirname(os.path.abspath(__file__))
    n2_path = os.path.join(script_dir, "kanji_n2.json")
    existing = json.load(open(n2_path, encoding="utf-8"))
    existing_chars = set(e['character'] for e in existing)
    skip = set(existing_chars)
    for level in ["n1", "n3", "n4", "n5"]:
        d = json.load(open(os.path.join(script_dir, f"kanji_{level}.json"), encoding="utf-8"))
        skip |= set(e['character'] for e in d)
    added = []
    skipped = []
    for e in new_data:
        if e['character'] in skip:
            skipped.append(e['character'])
        else:
            added.append(e)
            skip.add(e['character'])
    if skipped:
        print(f"Skipped: {len(skipped)}")
    merged = existing + added
    with open(n2_path, "w", encoding="utf-8") as f:
        json.dump(merged, f, ensure_ascii=False, indent=2)
    print(f"N2: {len(existing)} -> {len(merged)} (+{len(added)} new)")
