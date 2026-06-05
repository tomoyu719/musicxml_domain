part of '../ornament.dart';

final class TrillMark extends Ornament {
  const TrillMark() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is TrillMark;

  @override
  int get hashCode => runtimeType.hashCode;
}
