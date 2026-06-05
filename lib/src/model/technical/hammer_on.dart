part of '../technical.dart';

final class HammerOn extends Technical {
  const HammerOn({required this.type, this.number, this.text});

  final StartStop type;
  final int? number;
  final String? text;

  HammerOn copyWith({StartStop? type, int? number, String? text}) => HammerOn(
        type: type ?? this.type,
        number: number ?? this.number,
        text: text ?? this.text,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HammerOn &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number &&
          text == other.text;

  @override
  int get hashCode => Object.hash(type, number, text);
}
