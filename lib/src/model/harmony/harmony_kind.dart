part of '../harmony.dart';

final class HarmonyKind {
  const HarmonyKind({
    required this.value,
    this.text,
    this.useSymbols = false,
    this.stackDegrees = false,
  });

  final HarmonyKindValue value;
  final String? text;
  final bool useSymbols;
  final bool stackDegrees;

  HarmonyKind copyWith({
    HarmonyKindValue? value,
    String? text,
    bool? useSymbols,
    bool? stackDegrees,
  }) =>
      HarmonyKind(
        value: value ?? this.value,
        text: text ?? this.text,
        useSymbols: useSymbols ?? this.useSymbols,
        stackDegrees: stackDegrees ?? this.stackDegrees,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HarmonyKind &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          text == other.text &&
          useSymbols == other.useSymbols &&
          stackDegrees == other.stackDegrees;

  @override
  int get hashCode => Object.hash(value, text, useSymbols, stackDegrees);
}
