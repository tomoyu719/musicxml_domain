part of '../time_signature.dart';

final class MeterTime extends TimeSignature {
  const MeterTime({
    required this.beats,
    required this.beatType,
    this.number,
    this.symbol,
  });

  final String beats;
  final int beatType;
  final int? number;
  final TimeSymbol? symbol;

  MeterTime copyWith({
    String? beats,
    int? beatType,
    int? number,
    TimeSymbol? symbol,
  }) =>
      MeterTime(
        beats: beats ?? this.beats,
        beatType: beatType ?? this.beatType,
        number: number ?? this.number,
        symbol: symbol ?? this.symbol,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeterTime &&
          runtimeType == other.runtimeType &&
          beats == other.beats &&
          beatType == other.beatType &&
          number == other.number &&
          symbol == other.symbol;

  @override
  int get hashCode => Object.hash(beats, beatType, number, symbol);
}
