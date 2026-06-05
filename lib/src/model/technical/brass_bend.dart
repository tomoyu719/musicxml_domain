part of '../technical.dart';

final class BrassBend extends Technical {
  const BrassBend() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is BrassBend;

  @override
  int get hashCode => runtimeType.hashCode;
}
