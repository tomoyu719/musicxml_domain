part of '../articulation.dart';

final class Staccato extends Articulation {
  const Staccato() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Staccato;

  @override
  int get hashCode => runtimeType.hashCode;
}
