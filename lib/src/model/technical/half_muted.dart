part of '../technical.dart';

final class HalfMuted extends Technical {
  const HalfMuted() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is HalfMuted;

  @override
  int get hashCode => runtimeType.hashCode;
}
