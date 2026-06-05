part of '../articulation.dart';

final class Falloff extends Articulation {
  const Falloff() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Falloff;

  @override
  int get hashCode => runtimeType.hashCode;
}
