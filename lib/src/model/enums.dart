// All enum definitions for the project in one file per requirement spec.

/// Pitch step (A–G).
enum Step {
  a('A'),
  b('B'),
  c('C'),
  d('D'),
  e('E'),
  f('F'),
  g('G');

  const Step(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Note type (duration symbol).
enum NoteType {
  n1024th('1024th'),
  n512th('512th'),
  n256th('256th'),
  n128th('128th'),
  n64th('64th'),
  n32nd('32nd'),
  n16th('16th'),
  eighth('eighth'),
  quarter('quarter'),
  half('half'),
  whole('whole'),
  breve('breve'),
  long('long'),
  maxima('maxima');

  const NoteType(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Accidental type including microtonal symbols.
enum AccidentalType {
  sharp('sharp'),
  naturalSharp('natural-sharp'),
  natural('natural'),
  naturalFlat('natural-flat'),
  flat('flat'),
  doubleSharp('double-sharp'),
  sharpSharp('sharp-sharp'),
  flatFlat('flat-flat'),
  quarterFlat('quarter-flat'),
  quarterSharp('quarter-sharp'),
  threeQuartersFlat('three-quarters-flat'),
  threeQuartersSharp('three-quarters-sharp'),
  sharpDown('sharp-down'),
  sharpUp('sharp-up'),
  naturalDown('natural-down'),
  naturalUp('natural-up'),
  flatDown('flat-down'),
  flatUp('flat-up'),
  doubleSharpDown('double-sharp-down'),
  doubleSharpUp('double-sharp-up'),
  flatFlatDown('flat-flat-down'),
  flatFlatUp('flat-flat-up'),
  arrowDown('arrow-down'),
  arrowUp('arrow-up'),
  tripleSharp('triple-sharp'),
  tripleFlat('triple-flat'),
  slashQuarterSharp('slash-quarter-sharp'),
  slashSharp('slash-sharp'),
  slashFlat('slash-flat'),
  doubleSlashFlat('double-slash-flat'),
  sharp1('sharp-1'),
  sharp2('sharp-2'),
  sharp3('sharp-3'),
  sharp5('sharp-5'),
  flat1('flat-1'),
  flat2('flat-2'),
  flat3('flat-3'),
  flat4('flat-4'),
  sori('sori'),
  koron('koron'),
  otherAccidental('other');

  const AccidentalType(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Stem direction.
enum StemDirection {
  up('up'),
  down('down'),
  doubleBeam('double'),
  none('none');

  const StemDirection(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Beam type.
enum BeamType {
  begin('begin'),
  continueBeam('continue'),
  end('end'),
  forwardHook('forward hook'),
  backwardHook('backward hook');

  const BeamType(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Clef sign.
enum ClefSign {
  g('G'),
  f('F'),
  c('C'),
  percussion('percussion'),
  tab('TAB'),
  jianpu('jianpu'),
  none('none');

  const ClefSign(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Key mode (tonality).
enum KeyMode {
  major('major'),
  minor('minor'),
  dorian('dorian'),
  phrygian('phrygian'),
  lydian('lydian'),
  mixolydian('mixolydian'),
  aeolian('aeolian'),
  ionian('ionian'),
  locrian('locrian'),
  none('none');

  const KeyMode(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Notehead type.
enum NoteheadType {
  slash('slash'),
  triangle('triangle'),
  diamond('diamond'),
  square('square'),
  cross('cross'),
  x('x'),
  circleX('circle-x'),
  invertedTriangle('inverted triangle'),
  arrowDown('arrow down'),
  arrowUp('arrow up'),
  circled('circled'),
  slashed('slashed'),
  backSlashed('back slashed'),
  normal('normal'),
  cluster('cluster'),
  circleDot('circle dot'),
  leftTriangle('left triangle'),
  rectangle('rectangle'),
  none('none'),
  doh('do'),
  re('re'),
  mi('mi'),
  fa('fa'),
  faUp('fa up'),
  so('so'),
  la('la'),
  ti('ti');

  const NoteheadType(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Lyric syllable type.
enum Syllabic {
  single('single'),
  begin('begin'),
  end('end'),
  middle('middle');

  const Syllabic(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Bar line style.
enum BarStyle {
  regular('regular'),
  dotted('dotted'),
  dashed('dashed'),
  heavy('heavy'),
  lightLight('light-light'),
  lightHeavy('light-heavy'),
  heavyLight('heavy-light'),
  heavyHeavy('heavy-heavy'),
  tick('tick'),
  short('short'),
  none('none');

  const BarStyle(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Harmony kind (chord quality).
enum HarmonyKindValue {
  major('major'),
  minor('minor'),
  augmented('augmented'),
  diminished('diminished'),
  dominant('dominant'),
  majorSeventh('major-seventh'),
  minorSeventh('minor-seventh'),
  diminishedSeventh('diminished-seventh'),
  augmentedSeventh('augmented-seventh'),
  halfDiminished('half-diminished'),
  majorMinor('major-minor'),
  majorSixth('major-sixth'),
  minorSixth('minor-sixth'),
  dominantNinth('dominant-ninth'),
  majorNinth('major-ninth'),
  minorNinth('minor-ninth'),
  dominant11th('dominant-11th'),
  major11th('major-11th'),
  minor11th('minor-11th'),
  dominant13th('dominant-13th'),
  major13th('major-13th'),
  minor13th('minor-13th'),
  suspendedSecond('suspended-second'),
  suspendedFourth('suspended-fourth'),
  neapolitan('Neapolitan'),
  italian('Italian'),
  french('French'),
  german('German'),
  pedal('pedal'),
  power('power'),
  tristan('Tristan'),
  other('other'),
  none('none');

  const HarmonyKindValue(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Dynamics marking type.
enum DynamicsType {
  p('p'),
  pp('pp'),
  ppp('ppp'),
  pppp('pppp'),
  ppppp('ppppp'),
  pppppp('pppppp'),
  f('f'),
  ff('ff'),
  fff('fff'),
  ffff('ffff'),
  fffff('fffff'),
  ffffff('ffffff'),
  mp('mp'),
  mf('mf'),
  sf('sf'),
  sfp('sfp'),
  sfpp('sfpp'),
  fp('fp'),
  rf('rf'),
  rfz('rfz'),
  sfz('sfz'),
  sffz('sffz'),
  fz('fz'),
  n('n'),
  pf('pf'),
  sfzp('sfzp'),
  otherDynamics('other-dynamics');

  const DynamicsType(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Simple start/stop type.
enum StartStop {
  start('start'),
  stop('stop');

  const StartStop(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Start, stop, or continue type.
enum StartStopContinue {
  start('start'),
  stop('stop'),
  continueValue('continue');

  const StartStopContinue(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Tie type.
enum TieType {
  start('start'),
  stop('stop');

  const TieType(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Wedge (hairpin) type.
enum WedgeType {
  crescendo('crescendo'),
  diminuendo('diminuendo'),
  stop('stop'),
  continueValue('continue');

  const WedgeType(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Pedal type.
enum PedalType {
  start('start'),
  stop('stop'),
  sostenuto('sostenuto'),
  change('change'),
  continueValue('continue');

  const PedalType(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Octave shift type.
enum OctaveShiftType {
  up('up'),
  down('down'),
  stop('stop'),
  continueValue('continue');

  const OctaveShiftType(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Fermata shape.
enum FermataShape {
  normal('normal'),
  angled('angled'),
  square('square');

  const FermataShape(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Tremolo type.
enum TremoloType {
  start('start'),
  stop('stop'),
  single('single'),
  unmeasured('unmeasured');

  const TremoloType(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Line type.
enum LineType {
  solid('solid'),
  dashed('dashed'),
  dotted('dotted'),
  wavy('wavy');

  const LineType(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Placement relative to staff.
enum Placement {
  above('above'),
  below('below');

  const Placement(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Arpeggiate direction.
enum ArpeggiateDirection {
  up('up'),
  down('down');

  const ArpeggiateDirection(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Non-arpeggiate type.
enum NonArpeggiateType {
  top('top'),
  bottom('bottom');

  const NonArpeggiateType(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Repeat barline direction.
enum RepeatDirection {
  forward('forward'),
  backward('backward');

  const RepeatDirection(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Winged repeat type.
enum WingedType {
  none('none'),
  straight('straight'),
  curved('curved'),
  doubleStraight('double-straight'),
  doubleCurved('double-curved');

  const WingedType(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Line end type for brackets.
enum LineEndType {
  up('up'),
  down('down'),
  both('both'),
  arrow('arrow'),
  none('none');

  const LineEndType(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Harmony type.
enum HarmonyType {
  explicit('explicit'),
  implied('implied'),
  alternate('alternate');

  const HarmonyType(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Harmony degree type.
enum DegreeType {
  add('add'),
  alter('alter'),
  subtract('subtract');

  const DegreeType(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Barline location.
enum BarlineLocation {
  right('right'),
  left('left'),
  middle('middle');

  const BarlineLocation(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Part symbol type.
enum PartSymbolType {
  none('none'),
  brace('brace'),
  line('line'),
  bracket('bracket'),
  square('square');

  const PartSymbolType(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Tied notation type (notation-level; broader than note-level TieType).
enum TiedType {
  start('start'),
  stop('stop'),
  continueValue('continue'),
  letRing('let-ring');

  const TiedType(this.value);

  /// MusicXML string representation.
  final String value;
}

/// Controls what is shown on a tuplet bracket (show-number / show-type).
enum ShowTuplet {
  actual('actual'),
  both('both'),
  none('none');

  const ShowTuplet(this.value);

  /// MusicXML string representation.
  final String value;
}
