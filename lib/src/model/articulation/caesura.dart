part of '../articulation.dart';

final class Caesura extends Articulation {
  const Caesura({this.type});

  final String? type;

  Caesura copyWith({String? type}) => Caesura(type: type ?? this.type);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Caesura &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;
}
