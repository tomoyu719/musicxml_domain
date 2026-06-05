# musicxml_domain 要件定義

## 概要

MusicXML（v4.0）から楽譜ドメインモデルを生成・変換するDartパッケージ。
パース（MusicXML → ドメインモデル）とシリアライズ（ドメインモデル → MusicXML）の両方をサポートする。

---

## スコープ

### 対応するMusicXML要素（完全対応）

#### スコアレベル
- `score-partwise` / `score-timewise`（相互変換含む）
- `work`（work-number, work-title）
- `movement-number`, `movement-title`
- `identification`（creator, rights, encoding）
- `part-list`（score-part, part-group）
- `defaults`（scaling, page-layout, system-layout, staff-layout, appearance, music-font, word-font, lyric-font）
- `credit`

#### パート・小節レベル
- `part`
- `measure`（number, implicit, non-controlling属性）
- `attributes`（mid-measure変更含む）
  - `divisions`
  - `key`（調号: fifths + mode、非標準調号も含む）
  - `time`（拍子記号: beats/beat-type, common/cut記号）
  - `staves`（多段譜）
  - `part-symbol`
  - `instruments`
  - `clef`（全種類: G, F, C, percussion, TAB, jianpu, none）
  - `staff-details`（チューニング等）
  - `transpose`
  - `directive`
  - `measure-style`（multiple-rest, measure-repeat, beat-repeat, slash）
- `print`
- `sound`（tempo, dynamics, pizzicato等）
- `listening`（sync, offset）

#### 音符レベル
- `note`
  - `pitch`（step, alter, octave）
  - `rest`（measure属性含む）
  - `unpitched`（display-step, display-octave）
  - `duration`
  - `tie`（type: start/stop）
  - `voice`
  - `type`（全種類: 1024th〜maxima）
  - `dot`（augmentation dots）
  - `accidental`（全種類: sharp/flat/natural含む微分音記号）
  - `time-modification`（tuplet用）
  - `stem`
  - `notehead`（notehead-text含む）
  - `notehead-text`
  - `staff`
  - `beam`（begin/continue/end/forward-hook/backward-hook）
  - `notations`（下記参照）
  - `lyric`（下記参照）
  - `play`
  - `listen`
  - `chord`（和音）
  - `grace`（grace-note: slash属性含む）

#### Notations（記譜記号）
- `tied`（type: start/stop/continue/let-ring）
- `slur`（type, number, placement）
- `tuplet`（type, number, bracket, show-number, show-type）
- `glissando`（type, number, line-type, text）
- `slide`（type, number, line-type）
- `ornaments`
  - `trill-mark`
  - `turn`, `delayed-turn`, `inverted-turn`, `delayed-inverted-turn`
  - `vertical-turn`, `inverted-vertical-turn`
  - `shake`
  - `wavy-line`
  - `mordent`, `inverted-mordent`（long属性含む）
  - `schleifer`
  - `tremolo`（type: start/stop/single/unmeasured）
  - `haydn`
  - `other-ornament`
  - `accidental-mark`
- `technical`
  - `up-bow`, `down-bow`
  - `harmonic`（natural/artificial, base-pitch/touching-pitch/sounding-pitch）
  - `open-string`
  - `thumb-position`
  - `fingering`
  - `pluck`
  - `double-tongue`, `triple-tongue`
  - `stopped`
  - `snap-pizzicato`
  - `fret`
  - `string`
  - `hammer-on`, `pull-off`
  - `bend`（bend-alter, with-bar, pre-bend, release）
  - `tap`
  - `heel`, `toe`
  - `fingernails`
  - `hole`（hole-type, hole-closed, hole-shape）
  - `arrow`（arrow-direction, arrow-style, circular-arrow）
  - `handbell`
  - `brass-bend`
  - `flip`
  - `smear`
  - `open`
  - `half-muted`
  - `harmon-mute`（harmon-closed）
  - `golpe`
  - `other-technical`
- `articulations`
  - `accent`, `strong-accent`
  - `staccato`, `tenuto`, `detached-legato`
  - `staccatissimo`, `spiccato`
  - `scoop`, `plop`, `doit`, `falloff`
  - `breath-mark`（type）
  - `caesura`（type）
  - `stress`, `unstress`
  - `soft-accent`
  - `other-articulation`
- `dynamics`（p, pp, ppp, pppp, ppppp, pppppp, f, ff, fff, ffff, fffff, ffffff, mp, mf, sf, sfp, sfpp, fp, rf, rfz, sfz, sffz, fz, n, pf, sfzp, other-dynamics）
- `fermata`（type: normal/angled/square, inverted）
- `arpeggiate`（direction: up/down, unison）
- `non-arpeggiate`（type: top/bottom）
- `accent-mark`（type）
- `stress`
- `unstress`
- `other-notation`

#### Directions（演奏記号）
- `direction`
  - `rehearsal`
  - `segno`, `coda`
  - `words`
  - `symbol`
  - `wedge`（crescendo/diminuendo/stop/continue）
  - `dynamics`
  - `dashes`（type, number）
  - `bracket`（type, number, line-end）
  - `pedal`（type: start/stop/sostenuto/change/continue）
  - `metronome`（beat-unit, per-minute, metronome-note）
  - `octave-shift`（type: up/down/stop/continue, size）
  - `harp-pedals`
  - `damp`, `damp-all`
  - `eyeglasses`
  - `string-mute`
  - `scordatura`
  - `image`
  - `principal-voice`
  - `pan`
  - `numeral`
  - `other-direction`
- `offset`
- `staff`
- `sound`

#### Harmony（和音記号）
- `harmony`
  - `root`（root-step, root-alter）
  - `numeral`
  - `function`
  - `kind`（テキスト, use-symbols, stack-degrees, parentheses-degrees, bracket-degrees）
  - `inversion`
  - `bass`（bass-step, bass-alter, bass-separator）
  - `degree`（degree-value, degree-alter, degree-type）
  - `frame`（frame-strings, frame-frets, first-fret, frame-note）
  - `offset`
  - `staff`

#### 歌詞
- `lyric`
  - `syllabic`（single/begin/end/middle）
  - `text`
  - `extend`（type: start/stop/continue）
  - `laughing`
  - `humming`
  - `end-line`, `end-paragraph`
  - 複数lyric要素（number/name属性）

#### Barline（縦線）
- `barline`
  - `bar-style`（全種類）
  - `footnote`, `level`
  - `wavy-line`
  - `segno`, `coda`
  - `fermata`
  - `ending`（number, type）
  - `repeat`（direction: forward/backward, times, winged）

---

## 設計方針

### 言語・環境
- Dart 3.x（sealed class, pattern matching活用）
- コード生成なし（Freezed等不使用）
- 依存パッケージ: `xml`（XMLパース・ビルド用）のみ

### モデル設計
- イミュータブル（全フィールドは `final`）
- `sealed class` で多態性を表現（NoteContent, MusicElement, DirectionContent等）
- 全値オブジェクトに `copyWith`, `==`, `hashCode` を実装
- `const` コンストラクタを可能な限り利用

### ファイル構成

```
lib/
  src/
    model/
      enums.dart          # 全enum定義
      pitch.dart          # Pitch, DisplayPitch
      lyric.dart          # Lyric, LyricContent
      notation.dart       # Notations, Tied, Slur, Tuplet, Fermata, Arpeggiate,
                          # Glissando, Slide, Articulation, Ornament, Technical
      direction.dart      # Direction, DirectionContent (sealed)
      barline.dart        # Barline, Repeat, Ending
      harmony.dart        # Harmony, HarmonyRoot, HarmonyKind, HarmonyBass,
                          # HarmonyDegree, Frame, FrameNote
      note.dart           # Note, NoteContent (sealed), GraceInfo,
                          # TimeModification, Beam, Accidental, Stem, Notehead
      measure.dart        # Measure, MeasureAttributes, KeySignature,
                          # TimeSignature, Clef, MusicElement (sealed)
      score.dart          # Score, WorkInfo, Identification, Encoding,
                          # ScorePart, ScoreInstrument, MidiInstrument, Part,
                          # PartGroup, Defaults, Credit
    parser/
      musicxml_parser.dart      # MusicXmlParser: String → Score
    serializer/
      musicxml_serializer.dart  # MusicXmlSerializer: Score → String
  musicxml_domain.dart  # public API (全クラスをexport)
```

### パーサー仕様
- `score-partwise` および `score-timewise` の両形式を受け入れる
- `score-timewise` は内部で `score-partwise` 形式に変換してパース
- 不明な要素はスキップ（エラーにしない）
- `divisions` を正しく追跡し、duration値の意味を保持する
- 同一小節内の複数 `attributes` 変更を `AttributesChangeElement` として保持

### シリアライザー仕様
- 出力は `score-partwise` 形式
- MusicXML 4.0 スキーマに準拠
- `XmlBuilder` を使用してXMLを生成
- `pretty: true` でインデント済みXMLを出力

---

## テスト方針

- `test/` ディレクトリにユニットテストを配置
- パース → シリアライズ → 再パースのラウンドトリップテスト
- 各主要要素（音符、小節、パート、記号等）のパース/シリアライズ個別テスト
