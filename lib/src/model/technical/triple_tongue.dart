part of '../technical.dart';

final class TripleTongue extends Technical {
  const TripleTongue() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is TripleTongue;

  @override
  int get hashCode => runtimeType.hashCode;
}
