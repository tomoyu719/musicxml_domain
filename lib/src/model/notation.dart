// Sealed class + subclasses must colocate in same library.
// ignore_for_file: one_class_per_file

import 'package:collection/collection.dart';
import 'package:musicxml_domain/src/model/enums.dart';

// ─── Simple notation classes ─────────────────────────────────────────────────

final class Tied {
  const Tied({required this.type, this.number});

  final TiedType type;
  final int? number;

  Tied copyWith({TiedType? type, int? number}) =>
      Tied(type: type ?? this.type, number: number ?? this.number);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tied &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number;

  @override
  int get hashCode => Object.hash(type, number);
}

final class Slur {
  const Slur({required this.type, this.number, this.placement});

  final StartStopContinue type;
  final int? number;
  final Placement? placement;

  Slur copyWith({StartStopContinue? type, int? number, Placement? placement}) =>
      Slur(
        type: type ?? this.type,
        number: number ?? this.number,
        placement: placement ?? this.placement,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Slur &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number &&
          placement == other.placement;

  @override
  int get hashCode => Object.hash(type, number, placement);
}

final class Tuplet {
  const Tuplet({
    required this.type,
    this.number,
    this.bracket,
    this.showNumber,
    this.showType,
  });

  final StartStop type;
  final int? number;
  final bool? bracket;
  final ShowTuplet? showNumber;
  final ShowTuplet? showType;

  Tuplet copyWith({
    StartStop? type,
    int? number,
    bool? bracket,
    ShowTuplet? showNumber,
    ShowTuplet? showType,
  }) =>
      Tuplet(
        type: type ?? this.type,
        number: number ?? this.number,
        bracket: bracket ?? this.bracket,
        showNumber: showNumber ?? this.showNumber,
        showType: showType ?? this.showType,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tuplet &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number &&
          bracket == other.bracket &&
          showNumber == other.showNumber &&
          showType == other.showType;

  @override
  int get hashCode => Object.hash(type, number, bracket, showNumber, showType);
}

final class Glissando {
  const Glissando({
    required this.type,
    this.number,
    this.lineType,
    this.text,
  });

  final StartStop type;
  final int? number;
  final LineType? lineType;
  final String? text;

  Glissando copyWith({
    StartStop? type,
    int? number,
    LineType? lineType,
    String? text,
  }) =>
      Glissando(
        type: type ?? this.type,
        number: number ?? this.number,
        lineType: lineType ?? this.lineType,
        text: text ?? this.text,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Glissando &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number &&
          lineType == other.lineType &&
          text == other.text;

  @override
  int get hashCode => Object.hash(type, number, lineType, text);
}

final class Slide {
  const Slide({required this.type, this.number, this.lineType});

  final StartStop type;
  final int? number;
  final LineType? lineType;

  Slide copyWith({StartStop? type, int? number, LineType? lineType}) => Slide(
        type: type ?? this.type,
        number: number ?? this.number,
        lineType: lineType ?? this.lineType,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Slide &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number &&
          lineType == other.lineType;

  @override
  int get hashCode => Object.hash(type, number, lineType);
}

// ─── Ornament sealed class ───────────────────────────────────────────────────

sealed class Ornament {
  const Ornament();
}

final class TrillMark extends Ornament {
  const TrillMark() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is TrillMark;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Turn extends Ornament {
  const Turn() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Turn;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class DelayedTurn extends Ornament {
  const DelayedTurn() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DelayedTurn;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class InvertedTurn extends Ornament {
  const InvertedTurn() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is InvertedTurn;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class DelayedInvertedTurn extends Ornament {
  const DelayedInvertedTurn() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DelayedInvertedTurn;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class VerticalTurn extends Ornament {
  const VerticalTurn() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is VerticalTurn;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class InvertedVerticalTurn extends Ornament {
  const InvertedVerticalTurn() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is InvertedVerticalTurn;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Shake extends Ornament {
  const Shake() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Shake;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Schleifer extends Ornament {
  const Schleifer() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Schleifer;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Haydn extends Ornament {
  const Haydn() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Haydn;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class WavyLine extends Ornament {
  const WavyLine({required this.type});

  final StartStopContinue type;

  WavyLine copyWith({StartStopContinue? type}) =>
      WavyLine(type: type ?? this.type);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WavyLine &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;
}

final class Mordent extends Ornament {
  const Mordent({this.long = false});

  final bool long;

  Mordent copyWith({bool? long}) => Mordent(long: long ?? this.long);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Mordent &&
          runtimeType == other.runtimeType &&
          long == other.long;

  @override
  int get hashCode => long.hashCode;
}

final class InvertedMordent extends Ornament {
  const InvertedMordent({this.long = false});

  final bool long;

  InvertedMordent copyWith({bool? long}) =>
      InvertedMordent(long: long ?? this.long);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvertedMordent &&
          runtimeType == other.runtimeType &&
          long == other.long;

  @override
  int get hashCode => long.hashCode;
}

final class Tremolo extends Ornament {
  const Tremolo({required this.type, required this.marks});

  final TremoloType type;
  final int marks;

  Tremolo copyWith({TremoloType? type, int? marks}) =>
      Tremolo(type: type ?? this.type, marks: marks ?? this.marks);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tremolo &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          marks == other.marks;

  @override
  int get hashCode => Object.hash(type, marks);
}

final class OtherOrnament extends Ornament {
  const OtherOrnament({this.value});

  final String? value;

  OtherOrnament copyWith({String? value}) =>
      OtherOrnament(value: value ?? this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OtherOrnament &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

final class AccidentalMark extends Ornament {
  const AccidentalMark({required this.type, this.placement});

  final AccidentalType type;
  final Placement? placement;

  AccidentalMark copyWith({AccidentalType? type, Placement? placement}) =>
      AccidentalMark(
        type: type ?? this.type,
        placement: placement ?? this.placement,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccidentalMark &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          placement == other.placement;

  @override
  int get hashCode => Object.hash(type, placement);
}

// ─── Technical sealed class ──────────────────────────────────────────────────

sealed class Technical {
  const Technical();
}

final class UpBow extends Technical {
  const UpBow() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpBow;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class DownBow extends Technical {
  const DownBow() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is DownBow;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class OpenString extends Technical {
  const OpenString() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is OpenString;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class ThumbPosition extends Technical {
  const ThumbPosition() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ThumbPosition;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class DoubleTongue extends Technical {
  const DoubleTongue() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DoubleTongue;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class TripleTongue extends Technical {
  const TripleTongue() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is TripleTongue;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Stopped extends Technical {
  const Stopped() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Stopped;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class SnapPizzicato extends Technical {
  const SnapPizzicato() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SnapPizzicato;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Fingernails extends Technical {
  const Fingernails() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Fingernails;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class BrassBend extends Technical {
  const BrassBend() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is BrassBend;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Flip extends Technical {
  const Flip() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Flip;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Smear extends Technical {
  const Smear() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Smear;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Open extends Technical {
  const Open() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Open;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class HalfMuted extends Technical {
  const HalfMuted() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is HalfMuted;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Golpe extends Technical {
  const Golpe() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Golpe;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Fingering extends Technical {
  const Fingering({required this.value});

  final int value;

  Fingering copyWith({int? value}) => Fingering(value: value ?? this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Fingering &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

final class Pluck extends Technical {
  const Pluck({this.value});

  final String? value;

  Pluck copyWith({String? value}) => Pluck(value: value ?? this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pluck &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

final class Fret extends Technical {
  const Fret({required this.value});

  final int value;

  Fret copyWith({int? value}) => Fret(value: value ?? this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Fret &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

final class StringNumber extends Technical {
  const StringNumber({required this.value});

  final int value;

  StringNumber copyWith({int? value}) =>
      StringNumber(value: value ?? this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StringNumber &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

final class HammerOn extends Technical {
  const HammerOn({required this.type, this.number, this.text});

  final StartStop type;
  final int? number;
  final String? text;

  HammerOn copyWith({StartStop? type, int? number, String? text}) => HammerOn(
        type: type ?? this.type,
        number: number ?? this.number,
        text: text ?? this.text,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HammerOn &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number &&
          text == other.text;

  @override
  int get hashCode => Object.hash(type, number, text);
}

final class PullOff extends Technical {
  const PullOff({required this.type, this.number, this.text});

  final StartStop type;
  final int? number;
  final String? text;

  PullOff copyWith({StartStop? type, int? number, String? text}) => PullOff(
        type: type ?? this.type,
        number: number ?? this.number,
        text: text ?? this.text,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PullOff &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number &&
          text == other.text;

  @override
  int get hashCode => Object.hash(type, number, text);
}

final class Tap extends Technical {
  const Tap({this.value});

  final String? value;

  Tap copyWith({String? value}) => Tap(value: value ?? this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tap &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

final class Heel extends Technical {
  const Heel({this.substitution});

  final bool? substitution;

  Heel copyWith({bool? substitution}) =>
      Heel(substitution: substitution ?? this.substitution);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Heel &&
          runtimeType == other.runtimeType &&
          substitution == other.substitution;

  @override
  int get hashCode => substitution.hashCode;
}

final class Toe extends Technical {
  const Toe({this.substitution});

  final bool? substitution;

  Toe copyWith({bool? substitution}) =>
      Toe(substitution: substitution ?? this.substitution);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Toe &&
          runtimeType == other.runtimeType &&
          substitution == other.substitution;

  @override
  int get hashCode => substitution.hashCode;
}

final class Hole extends Technical {
  const Hole({this.type, this.closed, this.shape});

  final String? type;
  final String? closed;
  final String? shape;

  Hole copyWith({String? type, String? closed, String? shape}) => Hole(
        type: type ?? this.type,
        closed: closed ?? this.closed,
        shape: shape ?? this.shape,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Hole &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          closed == other.closed &&
          shape == other.shape;

  @override
  int get hashCode => Object.hash(type, closed, shape);
}

final class Arrow extends Technical {
  const Arrow({this.direction, this.style, this.circularArrow});

  final String? direction;
  final String? style;
  final String? circularArrow;

  Arrow copyWith({String? direction, String? style, String? circularArrow}) =>
      Arrow(
        direction: direction ?? this.direction,
        style: style ?? this.style,
        circularArrow: circularArrow ?? this.circularArrow,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Arrow &&
          runtimeType == other.runtimeType &&
          direction == other.direction &&
          style == other.style &&
          circularArrow == other.circularArrow;

  @override
  int get hashCode => Object.hash(direction, style, circularArrow);
}

final class Handbell extends Technical {
  const Handbell({required this.value});

  final String value;

  Handbell copyWith({String? value}) =>
      Handbell(value: value ?? this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Handbell &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

final class HarmonMute extends Technical {
  const HarmonMute({this.closed});

  final String? closed;

  HarmonMute copyWith({String? closed}) =>
      HarmonMute(closed: closed ?? this.closed);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HarmonMute &&
          runtimeType == other.runtimeType &&
          closed == other.closed;

  @override
  int get hashCode => closed.hashCode;
}

final class Harmonic extends Technical {
  const Harmonic({this.natural = false, this.artificial = false});

  final bool natural;
  final bool artificial;

  Harmonic copyWith({bool? natural, bool? artificial}) => Harmonic(
        natural: natural ?? this.natural,
        artificial: artificial ?? this.artificial,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Harmonic &&
          runtimeType == other.runtimeType &&
          natural == other.natural &&
          artificial == other.artificial;

  @override
  int get hashCode => Object.hash(natural, artificial);
}

final class Bend extends Technical {
  const Bend({
    required this.alter,
    this.withBar = false,
    this.preBend = false,
    this.release,
  });

  final double alter;
  final bool withBar;
  final bool preBend;
  final bool? release;

  Bend copyWith({
    double? alter,
    bool? withBar,
    bool? preBend,
    bool? release,
  }) =>
      Bend(
        alter: alter ?? this.alter,
        withBar: withBar ?? this.withBar,
        preBend: preBend ?? this.preBend,
        release: release ?? this.release,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Bend &&
          runtimeType == other.runtimeType &&
          alter == other.alter &&
          withBar == other.withBar &&
          preBend == other.preBend &&
          release == other.release;

  @override
  int get hashCode => Object.hash(alter, withBar, preBend, release);
}

final class OtherTechnical extends Technical {
  const OtherTechnical({this.value});

  final String? value;

  OtherTechnical copyWith({String? value}) =>
      OtherTechnical(value: value ?? this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OtherTechnical &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

// ─── Articulation sealed class ───────────────────────────────────────────────

sealed class Articulation {
  const Articulation();
}

final class Accent extends Articulation {
  const Accent() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Accent;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Staccato extends Articulation {
  const Staccato() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Staccato;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Tenuto extends Articulation {
  const Tenuto() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Tenuto;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class DetachedLegato extends Articulation {
  const DetachedLegato() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DetachedLegato;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Staccatissimo extends Articulation {
  const Staccatissimo() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Staccatissimo;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Spiccato extends Articulation {
  const Spiccato() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Spiccato;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Scoop extends Articulation {
  const Scoop() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Scoop;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Plop extends Articulation {
  const Plop() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Plop;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Doit extends Articulation {
  const Doit() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Doit;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Falloff extends Articulation {
  const Falloff() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Falloff;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Stress extends Articulation {
  const Stress() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Stress;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class Unstress extends Articulation {
  const Unstress() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Unstress;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class SoftAccent extends Articulation {
  const SoftAccent() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SoftAccent;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class StrongAccent extends Articulation {
  const StrongAccent({this.type});

  /// "up" or "down".
  final String? type;

  StrongAccent copyWith({String? type}) =>
      StrongAccent(type: type ?? this.type);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StrongAccent &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;
}

final class BreathMark extends Articulation {
  const BreathMark({this.type});

  final String? type;

  BreathMark copyWith({String? type}) =>
      BreathMark(type: type ?? this.type);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreathMark &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;
}

final class Caesura extends Articulation {
  const Caesura({this.type});

  final String? type;

  Caesura copyWith({String? type}) => Caesura(type: type ?? this.type);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Caesura &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;
}

final class OtherArticulation extends Articulation {
  const OtherArticulation({this.value});

  final String? value;

  OtherArticulation copyWith({String? value}) =>
      OtherArticulation(value: value ?? this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OtherArticulation &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

// ─── Container classes ───────────────────────────────────────────────────────

final class Dynamics {
  const Dynamics({this.types = const []});

  final List<DynamicsType> types;

  Dynamics copyWith({List<DynamicsType>? types}) =>
      Dynamics(types: types ?? this.types);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Dynamics &&
          runtimeType == other.runtimeType &&
          const ListEquality<DynamicsType>().equals(types, other.types);

  @override
  int get hashCode => const ListEquality<DynamicsType>().hash(types);
}

final class Fermata {
  const Fermata({this.shape, this.inverted = false});

  final FermataShape? shape;
  final bool inverted;

  Fermata copyWith({FermataShape? shape, bool? inverted}) => Fermata(
        shape: shape ?? this.shape,
        inverted: inverted ?? this.inverted,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Fermata &&
          runtimeType == other.runtimeType &&
          shape == other.shape &&
          inverted == other.inverted;

  @override
  int get hashCode => Object.hash(shape, inverted);
}

final class Arpeggiate {
  const Arpeggiate({this.direction, this.unison});

  final ArpeggiateDirection? direction;
  final bool? unison;

  Arpeggiate copyWith({ArpeggiateDirection? direction, bool? unison}) =>
      Arpeggiate(
        direction: direction ?? this.direction,
        unison: unison ?? this.unison,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Arpeggiate &&
          runtimeType == other.runtimeType &&
          direction == other.direction &&
          unison == other.unison;

  @override
  int get hashCode => Object.hash(direction, unison);
}

final class NonArpeggiate {
  const NonArpeggiate({required this.type});

  final NonArpeggiateType type;

  NonArpeggiate copyWith({NonArpeggiateType? type}) =>
      NonArpeggiate(type: type ?? this.type);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NonArpeggiate &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;
}

// ─── Notations root container ────────────────────────────────────────────────

final class Notations {
  const Notations({
    this.tied = const [],
    this.slurs = const [],
    this.tuplets = const [],
    this.glissandi = const [],
    this.slides = const [],
    this.ornaments = const [],
    this.technicals = const [],
    this.articulations = const [],
    this.dynamics = const [],
    this.fermatas = const [],
    this.arpeggiates = const [],
    this.nonArpeggiates = const [],
  });

  final List<Tied> tied;
  final List<Slur> slurs;
  final List<Tuplet> tuplets;
  final List<Glissando> glissandi;
  final List<Slide> slides;
  final List<Ornament> ornaments;
  final List<Technical> technicals;
  final List<Articulation> articulations;
  final List<Dynamics> dynamics;
  final List<Fermata> fermatas;
  final List<Arpeggiate> arpeggiates;
  final List<NonArpeggiate> nonArpeggiates;

  Notations copyWith({
    List<Tied>? tied,
    List<Slur>? slurs,
    List<Tuplet>? tuplets,
    List<Glissando>? glissandi,
    List<Slide>? slides,
    List<Ornament>? ornaments,
    List<Technical>? technicals,
    List<Articulation>? articulations,
    List<Dynamics>? dynamics,
    List<Fermata>? fermatas,
    List<Arpeggiate>? arpeggiates,
    List<NonArpeggiate>? nonArpeggiates,
  }) =>
      Notations(
        tied: tied ?? this.tied,
        slurs: slurs ?? this.slurs,
        tuplets: tuplets ?? this.tuplets,
        glissandi: glissandi ?? this.glissandi,
        slides: slides ?? this.slides,
        ornaments: ornaments ?? this.ornaments,
        technicals: technicals ?? this.technicals,
        articulations: articulations ?? this.articulations,
        dynamics: dynamics ?? this.dynamics,
        fermatas: fermatas ?? this.fermatas,
        arpeggiates: arpeggiates ?? this.arpeggiates,
        nonArpeggiates: nonArpeggiates ?? this.nonArpeggiates,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Notations &&
          runtimeType == other.runtimeType &&
          const ListEquality<Tied>().equals(tied, other.tied) &&
          const ListEquality<Slur>().equals(slurs, other.slurs) &&
          const ListEquality<Tuplet>().equals(tuplets, other.tuplets) &&
          const ListEquality<Glissando>().equals(glissandi, other.glissandi) &&
          const ListEquality<Slide>().equals(slides, other.slides) &&
          const ListEquality<Ornament>().equals(ornaments, other.ornaments) &&
          const ListEquality<Technical>()
              .equals(technicals, other.technicals) &&
          const ListEquality<Articulation>()
              .equals(articulations, other.articulations) &&
          const ListEquality<Dynamics>().equals(dynamics, other.dynamics) &&
          const ListEquality<Fermata>().equals(fermatas, other.fermatas) &&
          const ListEquality<Arpeggiate>()
              .equals(arpeggiates, other.arpeggiates) &&
          const ListEquality<NonArpeggiate>()
              .equals(nonArpeggiates, other.nonArpeggiates);

  @override
  int get hashCode => Object.hashAll([
        const ListEquality<Tied>().hash(tied),
        const ListEquality<Slur>().hash(slurs),
        const ListEquality<Tuplet>().hash(tuplets),
        const ListEquality<Glissando>().hash(glissandi),
        const ListEquality<Slide>().hash(slides),
        const ListEquality<Ornament>().hash(ornaments),
        const ListEquality<Technical>().hash(technicals),
        const ListEquality<Articulation>().hash(articulations),
        const ListEquality<Dynamics>().hash(dynamics),
        const ListEquality<Fermata>().hash(fermatas),
        const ListEquality<Arpeggiate>().hash(arpeggiates),
        const ListEquality<NonArpeggiate>().hash(nonArpeggiates),
      ]);
}
