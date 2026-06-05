part of '../ornament.dart';

final class Haydn extends Ornament {
  const Haydn() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Haydn;

  @override
  int get hashCode => runtimeType.hashCode;
}
