part of '../technical.dart';

final class OpenString extends Technical {
  const OpenString() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is OpenString;

  @override
  int get hashCode => runtimeType.hashCode;
}
