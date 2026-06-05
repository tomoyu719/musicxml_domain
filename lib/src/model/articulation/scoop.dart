part of '../articulation.dart';

final class Scoop extends Articulation {
  const Scoop() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Scoop;

  @override
  int get hashCode => runtimeType.hashCode;
}
