part of '../technical.dart';

final class DownBow extends Technical {
  const DownBow() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is DownBow;

  @override
  int get hashCode => runtimeType.hashCode;
}
