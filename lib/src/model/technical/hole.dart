part of '../technical.dart';

final class Hole extends Technical {
  const Hole({this.type, this.closed, this.shape});

  final String? type;
  final String? closed;
  final String? shape;

  Hole copyWith({String? type, String? closed, String? shape}) => Hole(
        type: type ?? this.type,
        closed: closed ?? this.closed,
        shape: shape ?? this.shape,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Hole &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          closed == other.closed &&
          shape == other.shape;

  @override
  int get hashCode => Object.hash(type, closed, shape);
}
