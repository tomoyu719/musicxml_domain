part of '../articulation.dart';

final class Staccatissimo extends Articulation {
  const Staccatissimo() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Staccatissimo;

  @override
  int get hashCode => runtimeType.hashCode;
}
