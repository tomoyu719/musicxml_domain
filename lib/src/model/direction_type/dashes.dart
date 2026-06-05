part of '../direction_type.dart';

final class Dashes extends DirectionType {
  const Dashes({required this.type, this.number});

  final StartStopContinue type;
  final int? number;

  Dashes copyWith({StartStopContinue? type, int? number}) =>
      Dashes(type: type ?? this.type, number: number ?? this.number);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Dashes &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number;

  @override
  int get hashCode => Object.hash(type, number);
}
