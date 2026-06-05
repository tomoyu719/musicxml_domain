part of '../technical.dart';

final class Smear extends Technical {
  const Smear() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Smear;

  @override
  int get hashCode => runtimeType.hashCode;
}
