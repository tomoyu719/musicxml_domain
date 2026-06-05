part of '../note_content.dart';

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
