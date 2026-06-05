part of '../technical.dart';

final class Fingernails extends Technical {
  const Fingernails() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Fingernails;

  @override
  int get hashCode => runtimeType.hashCode;
}
