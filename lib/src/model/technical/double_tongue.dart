part of '../technical.dart';

final class DoubleTongue extends Technical {
  const DoubleTongue() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DoubleTongue;

  @override
  int get hashCode => runtimeType.hashCode;
}
