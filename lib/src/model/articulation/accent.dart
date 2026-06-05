part of '../articulation.dart';

final class Accent extends Articulation {
  const Accent() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Accent;

  @override
  int get hashCode => runtimeType.hashCode;
}
