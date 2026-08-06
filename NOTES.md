# NOTES.md — 세션 인수인계 (2026-08-06 마감)

## 1. 결정 + 이유
- **v1.1.2+10 재발급**: versionCode 9가 공개 테스트 트랙에 출시된 이력 때문에 비공개 테스트 재등록이 거부됨 → 코드 변경 없이 버전만 승급(커밋 3a891df). Play는 상위 트랙에 소진된 versionCode의 하위 트랙 재사용을 막는다.
- **공개 테스트 트랙 중지 유지**: 활성화하면 옵트인 링크가 공개 트랙으로 우선 연결되어 비공개 옵트인(프로덕션 액세스 요건)을 가로챈다. 재활성화 금지.
- **Play 권장조치 3건 무대응 판정**: ①edge-to-edge는 v1.0.2+6에서 이미 대응+실기기 검증 ②deprecated API(setStatusBarColor 등)는 Flutter 엔진·pairip(Play 주입) 내부 코드로 앱에서 수정 불가 ③AGP 9.0은 Flutter 3.32 미지원이라 올리면 빌드 깨짐. ②③은 Flutter SDK 업그레이드로 수렴.

## 2. 버린 접근 + 이유
- 비공개 트랙에 versionCode 9 재등록 시도 → Play가 거부(공개 트랙 소진). 버전 승급이 유일 경로.
- AGP 9 선제 업그레이드 → Flutter Gradle 플러그인 비호환으로 기각.

## 3. 함정·제약
- **한자 마스터 DELETE 금지** (kanji.id FK — favorites/study_progress 등 유실). 동기화는 character 기준 INSERT OR IGNORE + UPDATE. UPSERT 금지(minSdk 21 = SQLite 3.8.x).
- assets/data/*.json 수정 시 `DataLoaderService.kDataVersion` 범프 필수 — 안 올리면 기존 유저에 영영 미반영.
- 로컬 빌드(업로드 키)로 Play 설치본 덮어쓰기 불가 — 서명 불일치가 정상.
- 14일 테스터 카운트는 **옵트인 기준** — 버전 9→10 교체로 리셋되지 않음.

## 4. 건드린 파일 (이번 마감 구간)
- `pubspec.yaml` — version 1.1.2+10
- `CLAUDE.md` — 버전 이력에 1.1.2+10 행 추가
- (메모리) `kanjistudy-release-state.md`, `MEMORY.md` — 릴리즈 상태 갱신

## 5. 진행 상태 + 다음 단계
- **완료**: targetSdk 36 + 후리가나 + 데이터 동기화 수정 + LIMIT 200 제거 전부 이 브랜치(PR #1, draft). v1.1.2+10 AAB 빌드·비공개 테스트 트랙 **출시함**(사용자 확인).
- **다음**: ①심사 "출시됨" 확인 → 참여 링크(play.google.com/apps/testing/com.kanjistudy.app) 지인 12~15명 배포 ②12명 옵트인 채운 날 +14일 유지(옵트아웃 금지) ③8월 중하순 대시보드 "프로덕션 액세스 신청" 설문(테스터 피드백 모아둘 것) ④승인·프로덕션 출시 확정 시 **PR #1 머지**(머지는 사용자 지시 대기).
- 보류 과제: Flutter SDK 3.32→3.44(공유 SDK — MyTube·nihongo-app2 영향 검토), 예측형 뒤로가기 opt-in 전환.

## 6. 열린 질문
- 프로덕션 액세스 심사 통과 시점(테스터 모집 속도에 좌우) — 2026-08-31 API 36 기한은 이미 충족이라 압박 없음.
