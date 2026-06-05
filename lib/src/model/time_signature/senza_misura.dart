part of '../time_signature.dart';

final class SenzaMisura extends TimeSignature {
  const SenzaMisura({this.number});

  final int? number;

  SenzaMisura copyWith({int? number}) =>
      SenzaMisura(number: number ?? this.number);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SenzaMisura &&
          runtimeType == other.runtimeType &&
          number == other.number;

  @override
  int get hashCode => number.hashCode;
}
