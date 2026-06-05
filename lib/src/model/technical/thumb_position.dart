part of '../technical.dart';

final class ThumbPosition extends Technical {
  const ThumbPosition() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ThumbPosition;

  @override
  int get hashCode => runtimeType.hashCode;
}
