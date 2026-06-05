part of '../key_signature.dart';

final class KeyAlteration {
  const KeyAlteration({
    required this.step,
    required this.alter,
    this.accidental,
  });

  final Step step;
  final double alter;
  final AccidentalType? accidental;

  KeyAlteration copyWith({
    Step? step,
    double? alter,
    AccidentalType? accidental,
  }) =>
      KeyAlteration(
        step: step ?? this.step,
        alter: alter ?? this.alter,
        accidental: accidental ?? this.accidental,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KeyAlteration &&
          runtimeType == other.runtimeType &&
          step == other.step &&
          alter == other.alter &&
          accidental == other.accidental;

  @override
  int get hashCode => Object.hash(step, alter, accidental);
}
