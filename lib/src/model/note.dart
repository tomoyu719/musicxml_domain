// Sealed class + subclasses must colocate in same library.
// ignore_for_file: one_class_per_file

import 'package:collection/collection.dart';
import 'package:musicxml_domain/src/model/enums.dart';
import 'package:musicxml_domain/src/model/lyric.dart';
import 'package:musicxml_domain/src/model/notation.dart';
import 'package:musicxml_domain/src/model/pitch.dart';

final class GraceInfo {
  const GraceInfo({this.slash = false});

  /// Whether the grace note has a slash (acciaccatura).
  final bool slash;

  GraceInfo copyWith({bool? slash}) => GraceInfo(slash: slash ?? this.slash);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GraceInfo &&
          runtimeType == other.runtimeType &&
          slash == other.slash;

  @override
  int get hashCode => slash.hashCode;
}

final class TimeModification {
  const TimeModification({
    required this.actualNotes,
    required this.normalNotes,
    this.normalType,
    this.normalDots = 0,
  });

  final int actualNotes;
  final int normalNotes;
  final NoteType? normalType;
  final int normalDots;

  TimeModification copyWith({
    int? actualNotes,
    int? normalNotes,
    NoteType? normalType,
    int? normalDots,
  }) =>
      TimeModification(
        actualNotes: actualNotes ?? this.actualNotes,
        normalNotes: normalNotes ?? this.normalNotes,
        normalType: normalType ?? this.normalType,
        normalDots: normalDots ?? this.normalDots,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeModification &&
          runtimeType == other.runtimeType &&
          actualNotes == other.actualNotes &&
          normalNotes == other.normalNotes &&
          normalType == other.normalType &&
          normalDots == other.normalDots;

  @override
  int get hashCode =>
      Object.hash(actualNotes, normalNotes, normalType, normalDots);
}

final class Beam {
  const Beam({required this.type, required this.number});

  final BeamType type;

  /// Beam number (1–8).
  final int number;

  Beam copyWith({BeamType? type, int? number}) =>
      Beam(type: type ?? this.type, number: number ?? this.number);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Beam &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number;

  @override
  int get hashCode => Object.hash(type, number);
}

final class Accidental {
  const Accidental({
    required this.type,
    this.cautionary = false,
    this.editorial = false,
  });

  final AccidentalType type;
  final bool cautionary;
  final bool editorial;

  Accidental copyWith({
    AccidentalType? type,
    bool? cautionary,
    bool? editorial,
  }) =>
      Accidental(
        type: type ?? this.type,
        cautionary: cautionary ?? this.cautionary,
        editorial: editorial ?? this.editorial,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Accidental &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          cautionary == other.cautionary &&
          editorial == other.editorial;

  @override
  int get hashCode => Object.hash(type, cautionary, editorial);
}

final class Stem {
  const Stem({required this.direction});

  final StemDirection direction;

  Stem copyWith({StemDirection? direction}) =>
      Stem(direction: direction ?? this.direction);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Stem &&
          runtimeType == other.runtimeType &&
          direction == other.direction;

  @override
  int get hashCode => direction.hashCode;
}

final class Notehead {
  const Notehead({required this.type, this.filled, this.parentheses});

  final NoteheadType type;
  final bool? filled;
  final bool? parentheses;

  Notehead copyWith({NoteheadType? type, bool? filled, bool? parentheses}) =>
      Notehead(
        type: type ?? this.type,
        filled: filled ?? this.filled,
        parentheses: parentheses ?? this.parentheses,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Notehead &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          filled == other.filled &&
          parentheses == other.parentheses;

  @override
  int get hashCode => Object.hash(type, filled, parentheses);
}

// ─── NoteContent sealed class ────────────────────────────────────────────────

sealed class NoteContent {
  const NoteContent();
}

final class PitchedNote extends NoteContent {
  const PitchedNote({
    required this.pitch,
    required this.duration,
    this.ties = const [],
  });

  final Pitch pitch;
  final int duration;
  final List<TieType> ties;

  PitchedNote copyWith({Pitch? pitch, int? duration, List<TieType>? ties}) =>
      PitchedNote(
        pitch: pitch ?? this.pitch,
        duration: duration ?? this.duration,
        ties: ties ?? this.ties,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PitchedNote &&
          runtimeType == other.runtimeType &&
          pitch == other.pitch &&
          duration == other.duration &&
          const ListEquality<TieType>().equals(ties, other.ties);

  @override
  int get hashCode =>
      Object.hash(pitch, duration, const ListEquality<TieType>().hash(ties));
}

final class RestNote extends NoteContent {
  const RestNote({
    required this.duration,
    this.measureRest = false,
    this.displayPitch,
  });

  final int duration;
  final bool measureRest;
  final DisplayPitch? displayPitch;

  RestNote copyWith({
    int? duration,
    bool? measureRest,
    DisplayPitch? displayPitch,
  }) =>
      RestNote(
        duration: duration ?? this.duration,
        measureRest: measureRest ?? this.measureRest,
        displayPitch: displayPitch ?? this.displayPitch,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestNote &&
          runtimeType == other.runtimeType &&
          duration == other.duration &&
          measureRest == other.measureRest &&
          displayPitch == other.displayPitch;

  @override
  int get hashCode => Object.hash(duration, measureRest, displayPitch);
}

final class UnpitchedNote extends NoteContent {
  const UnpitchedNote({required this.duration, this.displayPitch});

  final int duration;
  final DisplayPitch? displayPitch;

  UnpitchedNote copyWith({int? duration, DisplayPitch? displayPitch}) =>
      UnpitchedNote(
        duration: duration ?? this.duration,
        displayPitch: displayPitch ?? this.displayPitch,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnpitchedNote &&
          runtimeType == other.runtimeType &&
          duration == other.duration &&
          displayPitch == other.displayPitch;

  @override
  int get hashCode => Object.hash(duration, displayPitch);
}

// ─── Note ────────────────────────────────────────────────────────────────────

final class Note {
  const Note({
    required this.content,
    this.voice,
    this.type,
    this.dots = 0,
    this.accidental,
    this.timeModification,
    this.stem,
    this.notehead,
    this.staff,
    this.beams = const [],
    this.notations,
    this.lyrics = const [],
    this.chord = false,
    this.grace,
  });

  final NoteContent content;
  final String? voice;
  final NoteType? type;
  final int dots;
  final Accidental? accidental;
  final TimeModification? timeModification;
  final Stem? stem;
  final Notehead? notehead;
  final int? staff;
  final List<Beam> beams;
  final Notations? notations;
  final List<Lyric> lyrics;
  final bool chord;
  final GraceInfo? grace;

  Note copyWith({
    NoteContent? content,
    String? voice,
    NoteType? type,
    int? dots,
    Accidental? accidental,
    TimeModification? timeModification,
    Stem? stem,
    Notehead? notehead,
    int? staff,
    List<Beam>? beams,
    Notations? notations,
    List<Lyric>? lyrics,
    bool? chord,
    GraceInfo? grace,
  }) =>
      Note(
        content: content ?? this.content,
        voice: voice ?? this.voice,
        type: type ?? this.type,
        dots: dots ?? this.dots,
        accidental: accidental ?? this.accidental,
        timeModification: timeModification ?? this.timeModification,
        stem: stem ?? this.stem,
        notehead: notehead ?? this.notehead,
        staff: staff ?? this.staff,
        beams: beams ?? this.beams,
        notations: notations ?? this.notations,
        lyrics: lyrics ?? this.lyrics,
        chord: chord ?? this.chord,
        grace: grace ?? this.grace,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Note &&
          runtimeType == other.runtimeType &&
          content == other.content &&
          voice == other.voice &&
          type == other.type &&
          dots == other.dots &&
          accidental == other.accidental &&
          timeModification == other.timeModification &&
          stem == other.stem &&
          notehead == other.notehead &&
          staff == other.staff &&
          const ListEquality<Beam>().equals(beams, other.beams) &&
          notations == other.notations &&
          const ListEquality<Lyric>().equals(lyrics, other.lyrics) &&
          chord == other.chord &&
          grace == other.grace;

  @override
  int get hashCode => Object.hashAll([
        content,
        voice,
        type,
        dots,
        accidental,
        timeModification,
        stem,
        notehead,
        staff,
        const ListEquality<Beam>().hash(beams),
        notations,
        const ListEquality<Lyric>().hash(lyrics),
        chord,
        grace,
      ]);
}
