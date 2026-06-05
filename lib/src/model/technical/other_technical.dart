part of '../technical.dart';

final class OtherTechnical extends Technical {
  const OtherTechnical({this.value});

  final String? value;

  OtherTechnical copyWith({String? value}) =>
      OtherTechnical(value: value ?? this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OtherTechnical &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
