part of '../ornament.dart';

final class DelayedTurn extends Ornament {
  const DelayedTurn() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DelayedTurn;

  @override
  int get hashCode => runtimeType.hashCode;
}
