part of '../harmony.dart';

final class HarmonyRoot {
  const HarmonyRoot({required this.step, this.alter});

  final Step step;
  final double? alter;

  HarmonyRoot copyWith({Step? step, double? alter}) =>
      HarmonyRoot(step: step ?? this.step, alter: alter ?? this.alter);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HarmonyRoot &&
          runtimeType == other.runtimeType &&
          step == other.step &&
          alter == other.alter;

  @override
  int get hashCode => Object.hash(step, alter);
}
