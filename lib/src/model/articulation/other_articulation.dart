part of '../articulation.dart';

final class OtherArticulation extends Articulation {
  const OtherArticulation({this.value});

  final String? value;

  OtherArticulation copyWith({String? value}) =>
      OtherArticulation(value: value ?? this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OtherArticulation &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
