part of '../technical.dart';

final class Fret extends Technical {
  const Fret({required this.value});

  final int value;

  Fret copyWith({int? value}) => Fret(value: value ?? this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Fret &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
