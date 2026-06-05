part of '../technical.dart';

final class Harmonic extends Technical {
  const Harmonic({this.natural = false, this.artificial = false});

  final bool natural;
  final bool artificial;

  Harmonic copyWith({bool? natural, bool? artificial}) => Harmonic(
        natural: natural ?? this.natural,
        artificial: artificial ?? this.artificial,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Harmonic &&
          runtimeType == other.runtimeType &&
          natural == other.natural &&
          artificial == other.artificial;

  @override
  int get hashCode => Object.hash(natural, artificial);
}
