part of '../technical.dart';

final class Pluck extends Technical {
  const Pluck({this.value});

  final String? value;

  Pluck copyWith({String? value}) => Pluck(value: value ?? this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pluck &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
