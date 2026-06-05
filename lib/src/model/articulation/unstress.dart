part of '../articulation.dart';

final class Unstress extends Articulation {
  const Unstress() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Unstress;

  @override
  int get hashCode => runtimeType.hashCode;
}
