part of '../ornament.dart';

final class InvertedVerticalTurn extends Ornament {
  const InvertedVerticalTurn() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is InvertedVerticalTurn;

  @override
  int get hashCode => runtimeType.hashCode;
}
