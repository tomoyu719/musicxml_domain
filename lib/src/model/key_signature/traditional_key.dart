part of '../key_signature.dart';

final class TraditionalKey extends KeySignature {
  const TraditionalKey({
    required this.fifths,
    this.mode,
    this.number,
  });

  final int fifths;
  final KeyMode? mode;
  final int? number;

  TraditionalKey copyWith({
    int? fifths,
    KeyMode? mode,
    int? number,
  }) =>
      TraditionalKey(
        fifths: fifths ?? this.fifths,
        mode: mode ?? this.mode,
        number: number ?? this.number,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TraditionalKey &&
          runtimeType == other.runtimeType &&
          fifths == other.fifths &&
          mode == other.mode &&
          number == other.number;

  @override
  int get hashCode => Object.hash(fifths, mode, number);
}
