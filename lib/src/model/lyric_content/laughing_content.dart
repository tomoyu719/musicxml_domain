part of '../lyric_content.dart';

/// Laughing lyric content.
final class LaughingContent extends LyricContent {
  const LaughingContent() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is LaughingContent;

  @override
  int get hashCode => runtimeType.hashCode;
}
