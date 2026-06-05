part of '../ornament.dart';

final class InvertedMordent extends Ornament {
  const InvertedMordent({this.long = false});

  final bool long;

  InvertedMordent copyWith({bool? long}) =>
      InvertedMordent(long: long ?? this.long);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvertedMordent &&
          runtimeType == other.runtimeType &&
          long == other.long;

  @override
  int get hashCode => long.hashCode;
}
