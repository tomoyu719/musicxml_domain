part of '../articulation.dart';

final class Doit extends Articulation {
  const Doit() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Doit;

  @override
  int get hashCode => runtimeType.hashCode;
}
