part of '../ornament.dart';

final class Schleifer extends Ornament {
  const Schleifer() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Schleifer;

  @override
  int get hashCode => runtimeType.hashCode;
}
