part of '../ornament.dart';

final class AccidentalMark extends Ornament {
  const AccidentalMark({required this.type, this.placement});

  final AccidentalType type;
  final Placement? placement;

  AccidentalMark copyWith({AccidentalType? type, Placement? placement}) =>
      AccidentalMark(
        type: type ?? this.type,
        placement: placement ?? this.placement,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccidentalMark &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          placement == other.placement;

  @override
  int get hashCode => Object.hash(type, placement);
}
