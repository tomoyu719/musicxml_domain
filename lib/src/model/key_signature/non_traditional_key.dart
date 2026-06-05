part of '../key_signature.dart';

final class NonTraditionalKey extends KeySignature {
  const NonTraditionalKey({
    this.alterations = const [],
    this.number,
  });

  final List<KeyAlteration> alterations;
  final int? number;

  NonTraditionalKey copyWith({
    List<KeyAlteration>? alterations,
    int? number,
  }) =>
      NonTraditionalKey(
        alterations: alterations ?? this.alterations,
        number: number ?? this.number,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NonTraditionalKey &&
          runtimeType == other.runtimeType &&
          const ListEquality<KeyAlteration>()
              .equals(alterations, other.alterations) &&
          number == other.number;

  @override
  int get hashCode => Object.hash(
        const ListEquality<KeyAlteration>().hash(alterations),
        number,
      );
}
