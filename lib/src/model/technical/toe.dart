part of '../technical.dart';

final class Toe extends Technical {
  const Toe({this.substitution});

  final bool? substitution;

  Toe copyWith({bool? substitution}) =>
      Toe(substitution: substitution ?? this.substitution);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Toe &&
          runtimeType == other.runtimeType &&
          substitution == other.substitution;

  @override
  int get hashCode => substitution.hashCode;
}
