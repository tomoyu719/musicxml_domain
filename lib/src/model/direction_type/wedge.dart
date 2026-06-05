part of '../direction_type.dart';

final class Wedge extends DirectionType {
  const Wedge({required this.type, this.number, this.spread});

  final WedgeType type;
  final int? number;
  final double? spread;

  Wedge copyWith({WedgeType? type, int? number, double? spread}) =>
      Wedge(
        type: type ?? this.type,
        number: number ?? this.number,
        spread: spread ?? this.spread,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Wedge &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number &&
          spread == other.spread;

  @override
  int get hashCode => Object.hash(type, number, spread);
}
