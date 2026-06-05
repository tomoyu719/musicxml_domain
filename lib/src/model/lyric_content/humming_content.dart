part of '../lyric_content.dart';

/// Humming lyric content.
final class HummingContent extends LyricContent {
  const HummingContent() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is HummingContent;

  @override
  int get hashCode => runtimeType.hashCode;
}
