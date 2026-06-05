part of '../lyric_content.dart';

/// Extend-only lyric content.
final class ExtendContent extends LyricContent {
  const ExtendContent({this.type});

  final StartStopContinue? type;

  ExtendContent copyWith({StartStopContinue? type}) =>
      ExtendContent(type: type ?? this.type);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtendContent &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;
}
