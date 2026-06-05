part of '../technical.dart';

final class Stopped extends Technical {
  const Stopped() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Stopped;

  @override
  int get hashCode => runtimeType.hashCode;
}
