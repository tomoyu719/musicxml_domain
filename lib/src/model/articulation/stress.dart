part of '../articulation.dart';

final class Stress extends Articulation {
  const Stress() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Stress;

  @override
  int get hashCode => runtimeType.hashCode;
}
