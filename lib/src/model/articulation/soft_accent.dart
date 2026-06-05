part of '../articulation.dart';

final class SoftAccent extends Articulation {
  const SoftAccent() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SoftAccent;

  @override
  int get hashCode => runtimeType.hashCode;
}
