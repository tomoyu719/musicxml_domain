part of '../technical.dart';

final class Fingering extends Technical {
  const Fingering({required this.value});

  final int value;

  Fingering copyWith({int? value}) => Fingering(value: value ?? this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Fingering &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
