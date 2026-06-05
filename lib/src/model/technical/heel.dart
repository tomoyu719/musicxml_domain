part of '../technical.dart';

final class Heel extends Technical {
  const Heel({this.substitution});

  final bool? substitution;

  Heel copyWith({bool? substitution}) =>
      Heel(substitution: substitution ?? this.substitution);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Heel &&
          runtimeType == other.runtimeType &&
          substitution == other.substitution;

  @override
  int get hashCode => substitution.hashCode;
}
