part of '../ornament.dart';

final class DelayedInvertedTurn extends Ornament {
  const DelayedInvertedTurn() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DelayedInvertedTurn;

  @override
  int get hashCode => runtimeType.hashCode;
}
