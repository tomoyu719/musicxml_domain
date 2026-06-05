part of '../ornament.dart';

final class OtherOrnament extends Ornament {
  const OtherOrnament({this.value});

  final String? value;

  OtherOrnament copyWith({String? value}) =>
      OtherOrnament(value: value ?? this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OtherOrnament &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
