part of '../technical.dart';

final class SnapPizzicato extends Technical {
  const SnapPizzicato() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SnapPizzicato;

  @override
  int get hashCode => runtimeType.hashCode;
}
