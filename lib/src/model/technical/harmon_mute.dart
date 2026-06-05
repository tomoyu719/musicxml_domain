part of '../technical.dart';

final class HarmonMute extends Technical {
  const HarmonMute({this.closed});

  final String? closed;

  HarmonMute copyWith({String? closed}) =>
      HarmonMute(closed: closed ?? this.closed);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HarmonMute &&
          runtimeType == other.runtimeType &&
          closed == other.closed;

  @override
  int get hashCode => closed.hashCode;
}
