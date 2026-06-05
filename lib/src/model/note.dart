import 'package:collection/collection.dart';
import 'package:musicxml_domain/src/model/accidental.dart';
import 'package:musicxml_domain/src/model/beam.dart';
import 'package:musicxml_domain/src/model/enums.dart';
import 'package:musicxml_domain/src/model/grace_info.dart';
import 'package:musicxml_domain/src/model/lyric.dart';
import 'package:musicxml_domain/src/model/notation.dart';
import 'package:musicxml_domain/src/model/note_content.dart';
import 'package:musicxml_domain/src/model/notehead.dart';
import 'package:musicxml_domain/src/model/stem.dart';
import 'package:musicxml_domain/src/model/time_modification.dart';

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
