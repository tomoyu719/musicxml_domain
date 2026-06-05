part of '../ornament.dart';

final class WavyLine extends Ornament {
  const WavyLine({required this.type});

  final StartStopContinue type;

  WavyLine copyWith({StartStopContinue? type}) =>
      WavyLine(type: type ?? this.type);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WavyLine &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;
}
