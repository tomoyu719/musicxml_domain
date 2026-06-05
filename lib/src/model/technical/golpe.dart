part of '../technical.dart';

final class Golpe extends Technical {
  const Golpe() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Golpe;

  @override
  int get hashCode => runtimeType.hashCode;
}
