// Pitch and DisplayPitch are tightly coupled; colocated intentionally.
// ignore_for_file: one_class_per_file

import 'package:musicxml_domain/src/model/enums.dart';

/// A pitched note's frequency specification
/// (step, octave, optional alteration).
final class Pitch {
  const Pitch({
    required this.step,
    required this.octave,
    this.alter,
  });

  final Step step;

  /// MIDI octave number (e.g. 4 for middle C octave).
  final int octave;

  /// Chromatic alteration in half-steps
  /// (e.g. 1.0 for sharp, -0.5 for quarter-flat).
  final double? alter;

  Pitch copyWith({Step? step, int? octave, double? alter}) => Pitch(
        step: step ?? this.step,
        octave: octave ?? this.octave,
        alter: alter ?? this.alter,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pitch &&
          runtimeType == other.runtimeType &&
          step == other.step &&
          octave == other.octave &&
          alter == other.alter;

  @override
  int get hashCode => Object.hash(step, octave, alter);
}

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
