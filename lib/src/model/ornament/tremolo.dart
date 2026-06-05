part of '../ornament.dart';

final class Tremolo extends Ornament {
  const Tremolo({required this.type, required this.marks});

  final TremoloType type;
  final int marks;

  Tremolo copyWith({TremoloType? type, int? marks}) =>
      Tremolo(type: type ?? this.type, marks: marks ?? this.marks);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tremolo &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          marks == other.marks;

  @override
  int get hashCode => Object.hash(type, marks);
}
