part of '../articulation.dart';

final class DetachedLegato extends Articulation {
  const DetachedLegato() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DetachedLegato;

  @override
  int get hashCode => runtimeType.hashCode;
}
