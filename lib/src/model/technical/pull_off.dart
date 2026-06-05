part of '../technical.dart';

final class PullOff extends Technical {
  const PullOff({required this.type, this.number, this.text});

  final StartStop type;
  final int? number;
  final String? text;

  PullOff copyWith({StartStop? type, int? number, String? text}) => PullOff(
        type: type ?? this.type,
        number: number ?? this.number,
        text: text ?? this.text,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PullOff &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number &&
          text == other.text;

  @override
  int get hashCode => Object.hash(type, number, text);
}
