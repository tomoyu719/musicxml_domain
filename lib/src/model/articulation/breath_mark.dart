part of '../articulation.dart';

final class BreathMark extends Articulation {
  const BreathMark({this.type});

  final String? type;

  BreathMark copyWith({String? type}) =>
      BreathMark(type: type ?? this.type);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreathMark &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;
}
