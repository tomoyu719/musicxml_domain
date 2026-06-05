part of '../direction_type.dart';

final class OctaveShift extends DirectionType {
  const OctaveShift({required this.type, this.number, this.size = 8});

  final OctaveShiftType type;
  final int? number;
  final int size;

  OctaveShift copyWith({OctaveShiftType? type, int? number, int? size}) =>
      OctaveShift(
        type: type ?? this.type,
        number: number ?? this.number,
        size: size ?? this.size,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OctaveShift &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number &&
          size == other.size;

  @override
  int get hashCode => Object.hash(type, number, size);
}
