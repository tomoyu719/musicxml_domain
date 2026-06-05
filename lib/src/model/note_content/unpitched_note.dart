part of '../note_content.dart';

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
