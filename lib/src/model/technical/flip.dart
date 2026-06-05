part of '../technical.dart';

final class Flip extends Technical {
  const Flip() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Flip;

  @override
  int get hashCode => runtimeType.hashCode;
}
