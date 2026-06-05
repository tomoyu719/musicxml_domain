part of '../articulation.dart';

final class Spiccato extends Articulation {
  const Spiccato() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Spiccato;

  @override
  int get hashCode => runtimeType.hashCode;
}
