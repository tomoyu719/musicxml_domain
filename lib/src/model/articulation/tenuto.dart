part of '../articulation.dart';

final class Tenuto extends Articulation {
  const Tenuto() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Tenuto;

  @override
  int get hashCode => runtimeType.hashCode;
}
