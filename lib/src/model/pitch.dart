import 'package:musicxml_domain/src/model/enums.dart';

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
