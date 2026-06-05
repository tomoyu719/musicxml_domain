part of '../direction_type.dart';

final class Metronome extends DirectionType {
  const Metronome({
    required this.beatUnit,
    required this.perMinute,
    this.beatUnitDots = 0,
    this.parentheses = false,
  });

  final NoteType beatUnit;
  final String perMinute;
  final int beatUnitDots;
  final bool parentheses;

  Metronome copyWith({
    NoteType? beatUnit,
    String? perMinute,
    int? beatUnitDots,
    bool? parentheses,
  }) =>
      Metronome(
        beatUnit: beatUnit ?? this.beatUnit,
        perMinute: perMinute ?? this.perMinute,
        beatUnitDots: beatUnitDots ?? this.beatUnitDots,
        parentheses: parentheses ?? this.parentheses,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Metronome &&
          runtimeType == other.runtimeType &&
          beatUnit == other.beatUnit &&
          perMinute == other.perMinute &&
          beatUnitDots == other.beatUnitDots &&
          parentheses == other.parentheses;

  @override
  int get hashCode =>
      Object.hash(beatUnit, perMinute, beatUnitDots, parentheses);
}
