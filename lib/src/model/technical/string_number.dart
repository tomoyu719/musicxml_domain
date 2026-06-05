part of '../technical.dart';

final class StringNumber extends Technical {
  const StringNumber({required this.value});

  final int value;

  StringNumber copyWith({int? value}) =>
      StringNumber(value: value ?? this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StringNumber &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
