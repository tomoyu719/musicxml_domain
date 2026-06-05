part of '../technical.dart';

final class Bend extends Technical {
  const Bend({
    required this.alter,
    this.withBar = false,
    this.preBend = false,
    this.release,
  });

  final double alter;
  final bool withBar;
  final bool preBend;
  final bool? release;

  Bend copyWith({
    double? alter,
    bool? withBar,
    bool? preBend,
    bool? release,
  }) =>
      Bend(
        alter: alter ?? this.alter,
        withBar: withBar ?? this.withBar,
        preBend: preBend ?? this.preBend,
        release: release ?? this.release,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Bend &&
          runtimeType == other.runtimeType &&
          alter == other.alter &&
          withBar == other.withBar &&
          preBend == other.preBend &&
          release == other.release;

  @override
  int get hashCode => Object.hash(alter, withBar, preBend, release);
}
