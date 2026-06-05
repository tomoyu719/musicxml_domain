import 'package:musicxml_domain/src/model/enums.dart';

/// Display pitch for unpitched notes (step and octave, no alteration).
final class DisplayPitch {
  const DisplayPitch({
    required this.displayStep,
    required this.displayOctave,
  });

  final Step displayStep;
  final int displayOctave;

  DisplayPitch copyWith({
    Step? displayStep,
    int? displayOctave,
  }) =>
      DisplayPitch(
        displayStep: displayStep ?? this.displayStep,
        displayOctave: displayOctave ?? this.displayOctave,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DisplayPitch &&
          runtimeType == other.runtimeType &&
          displayStep == other.displayStep &&
          displayOctave == other.displayOctave;

  @override
  int get hashCode => Object.hash(displayStep, displayOctave);
}
