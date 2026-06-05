part of '../technical.dart';

final class UpBow extends Technical {
  const UpBow() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpBow;

  @override
  int get hashCode => runtimeType.hashCode;
}
