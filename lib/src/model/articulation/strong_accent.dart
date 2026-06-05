part of '../articulation.dart';

final class StrongAccent extends Articulation {
  const StrongAccent({this.type});

  /// "up" or "down".
  final String? type;

  StrongAccent copyWith({String? type}) =>
      StrongAccent(type: type ?? this.type);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StrongAccent &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;
}
