part of '../articulation.dart';

final class Plop extends Articulation {
  const Plop() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Plop;

  @override
  int get hashCode => runtimeType.hashCode;
}
