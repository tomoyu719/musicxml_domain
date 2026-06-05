# todo

## Phase 1: 基盤・コア値オブジェクト

- [ ] `pubspec.yaml` セットアップ（`xml` パッケージ依存追加）
- [ ] `lib/src/model/enums.dart` — 全 enum 定義
  - [ ] Step, NoteType, AccidentalType, StemDirection, BeamType
  - [ ] ClefSign, KeyMode, NoteheadType, Syllabic, BarStyle
  - [ ] HarmonyKindValue, DynamicsType, その他
- [ ] `lib/src/model/pitch.dart` — `Pitch`, `DisplayPitch`
- [ ] `lib/src/model/lyric.dart` — `LyricContent` (sealed), `Lyric`
- [ ] Phase 1 ユニットテスト（==, hashCode, copyWith）

## Phase 2: 音符モデル

- [ ] `lib/src/model/notation.dart`
  - [ ] `Tied`, `Slur`, `Tuplet`, `Glissando`, `Slide`
  - [ ] `Ornament` sealed class（全種類）
  - [ ] `Technical` sealed class（全種類）
  - [ ] `Articulation` sealed class（全種類）
  - [ ] `Dynamics`, `Fermata`, `Arpeggiate`, `NonArpeggiate`
  - [ ] `Notations`
- [ ] `lib/src/model/note.dart`
  - [ ] `GraceInfo`, `TimeModification`, `Beam`, `Accidental`, `Stem`, `Notehead`
  - [ ] `NoteContent` sealed class（PitchedNote, RestNote, UnpitchedNote）
  - [ ] `Note`
- [ ] Phase 2 ユニットテスト

## Phase 3: 小節・パート・スコアモデル

- [ ] `lib/src/model/direction.dart`
  - [ ] `DirectionContent` sealed class（全 19 種別）
  - [ ] `Direction`
- [ ] `lib/src/model/barline.dart` — `Repeat`, `Ending`, `Barline`
- [ ] `lib/src/model/harmony.dart`
  - [ ] `HarmonyRoot`, `HarmonyKind`, `HarmonyBass`, `HarmonyDegree`
  - [ ] `FrameNote`, `Frame`, `Harmony`
- [ ] `lib/src/model/measure.dart`
  - [ ] `KeySignature`, `TimeSignature`, `Clef`, `MeasureAttributes`
  - [ ] `MusicElement` sealed class（Note/AttributesChange/Direction/Harmony/Barline/Print/Sound/Backup/Forward）
  - [ ] `Measure`
- [ ] `lib/src/model/score.dart`
  - [ ] `WorkInfo`, `Encoding`, `Identification`
  - [ ] `ScoreInstrument`, `MidiInstrument`, `ScorePart`, `PartGroup`
  - [ ] `Defaults`, `Credit`, `Part`, `Score`
- [ ] Phase 3 ユニットテスト

## Phase 4: パーサー実装

- [ ] `lib/src/parser/musicxml_parser.dart` — `MusicXmlParser` 骨格
- [ ] score-partwise パース（work, identification, defaults, credit, part-list, part/measure）
- [ ] score-timewise → score-partwise 変換
- [ ] `attributes` パース（divisions トラッキング含む）
- [ ] `note` 全フィールドパース
- [ ] `notations` パース
- [ ] `lyric` パース
- [ ] `direction` パース
- [ ] `harmony` パース
- [ ] `barline` パース
- [ ] `print`, `sound`, `listening`, `backup`, `forward` パース
- [ ] Phase 4 パーステスト

## Phase 5: シリアライザー実装

- [ ] `lib/src/serializer/musicxml_serializer.dart` — `MusicXmlSerializer` 骨格
- [ ] Score → score-partwise XML
- [ ] `work`, `identification`, `defaults`, `credit` シリアライズ
- [ ] `part-list` シリアライズ
- [ ] `part` / `measure` / `attributes` シリアライズ
- [ ] `note` 全フィールドシリアライズ
- [ ] `notations`, `lyric` シリアライズ
- [ ] `direction`, `harmony`, `barline` シリアライズ
- [ ] pretty print 対応
- [ ] Phase 5 シリアライズテスト

## Phase 6: 統合・仕上げ

- [ ] `lib/musicxml_domain.dart` — 全クラスを export
- [ ] ラウンドトリップテスト（パース → シリアライズ → 再パース）
- [ ] score-timewise ラウンドトリップテスト
- [ ] README 作成
- [ ] CHANGELOG 作成
