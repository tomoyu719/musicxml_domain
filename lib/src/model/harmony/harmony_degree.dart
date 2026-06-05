part of '../harmony.dart';

final class HarmonyDegree {
  const HarmonyDegree({
    required this.degreeValue,
    required this.degreeAlter,
    required this.degreeType,
  });

  final int degreeValue;
  final double degreeAlter;
  final DegreeType degreeType;

  HarmonyDegree copyWith({
    int? degreeValue,
    double? degreeAlter,
    DegreeType? degreeType,
  }) =>
      HarmonyDegree(
        degreeValue: degreeValue ?? this.degreeValue,
        degreeAlter: degreeAlter ?? this.degreeAlter,
        degreeType: degreeType ?? this.degreeType,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HarmonyDegree &&
          runtimeType == other.runtimeType &&
          degreeValue == other.degreeValue &&
          degreeAlter == other.degreeAlter &&
          degreeType == other.degreeType;

  @override
  int get hashCode => Object.hash(degreeValue, degreeAlter, degreeType);
}
