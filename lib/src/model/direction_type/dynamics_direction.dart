part of '../direction_type.dart';

final class DynamicsDirection extends DirectionType {
  const DynamicsDirection({this.dynamics = const []});

  final List<DynamicsType> dynamics;

  DynamicsDirection copyWith({List<DynamicsType>? dynamics}) =>
      DynamicsDirection(dynamics: dynamics ?? this.dynamics);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DynamicsDirection &&
          runtimeType == other.runtimeType &&
          const ListEquality<DynamicsType>().equals(dynamics, other.dynamics);

  @override
  int get hashCode => const ListEquality<DynamicsType>().hash(dynamics);
}
