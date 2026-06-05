part of '../ornament.dart';

final class VerticalTurn extends Ornament {
  const VerticalTurn() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is VerticalTurn;

  @override
  int get hashCode => runtimeType.hashCode;
}
