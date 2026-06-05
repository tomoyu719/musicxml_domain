part of '../technical.dart';

final class Tap extends Technical {
  const Tap({this.value});

  final String? value;

  Tap copyWith({String? value}) => Tap(value: value ?? this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tap && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
