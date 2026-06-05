part of '../technical.dart';

final class Handbell extends Technical {
  const Handbell({required this.value});

  final String value;

  Handbell copyWith({String? value}) => Handbell(value: value ?? this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Handbell &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
