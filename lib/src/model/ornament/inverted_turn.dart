part of '../ornament.dart';

final class InvertedTurn extends Ornament {
  const InvertedTurn() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is InvertedTurn;

  @override
  int get hashCode => runtimeType.hashCode;
}
