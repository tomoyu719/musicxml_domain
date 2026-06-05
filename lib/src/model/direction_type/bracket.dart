part of '../direction_type.dart';

final class Bracket extends DirectionType {
  const Bracket({
    required this.type,
    required this.lineEnd,
    this.number,
    this.lineType,
  });

  final StartStopContinue type;
  final LineEndType lineEnd;
  final int? number;
  final LineType? lineType;

  Bracket copyWith({
    StartStopContinue? type,
    LineEndType? lineEnd,
    int? number,
    LineType? lineType,
  }) =>
      Bracket(
        type: type ?? this.type,
        lineEnd: lineEnd ?? this.lineEnd,
        number: number ?? this.number,
        lineType: lineType ?? this.lineType,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Bracket &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          lineEnd == other.lineEnd &&
          number == other.number &&
          lineType == other.lineType;

  @override
  int get hashCode => Object.hash(type, lineEnd, number, lineType);
}
