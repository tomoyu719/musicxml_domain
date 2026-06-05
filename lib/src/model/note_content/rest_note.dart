part of '../note_content.dart';

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
