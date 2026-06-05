part of '../ornament.dart';

final class Turn extends Ornament {
  const Turn() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Turn;

  @override
  int get hashCode => runtimeType.hashCode;
}
