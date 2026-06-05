part of '../ornament.dart';

final class Shake extends Ornament {
  const Shake() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Shake;

  @override
  int get hashCode => runtimeType.hashCode;
}
