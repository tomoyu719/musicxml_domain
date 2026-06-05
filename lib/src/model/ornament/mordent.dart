part of '../ornament.dart';

final class Mordent extends Ornament {
  const Mordent({this.long = false});

  final bool long;

  Mordent copyWith({bool? long}) => Mordent(long: long ?? this.long);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Mordent &&
          runtimeType == other.runtimeType &&
          long == other.long;

  @override
  int get hashCode => long.hashCode;
}
