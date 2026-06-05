part of '../direction_type.dart';

final class Pedal extends DirectionType {
  const Pedal({
    required this.type,
    this.number,
    this.line = false,
    this.sign = false,
  });

  final PedalType type;
  final int? number;
  final bool line;
  final bool sign;

  Pedal copyWith({
    PedalType? type,
    int? number,
    bool? line,
    bool? sign,
  }) =>
      Pedal(
        type: type ?? this.type,
        number: number ?? this.number,
        line: line ?? this.line,
        sign: sign ?? this.sign,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pedal &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number &&
          line == other.line &&
          sign == other.sign;

  @override
  int get hashCode => Object.hash(type, number, line, sign);
}
