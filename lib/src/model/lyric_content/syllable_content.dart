part of '../lyric_content.dart';

/// Text syllable content with optional syllabic type and extend.
final class SyllableContent extends LyricContent {
  const SyllableContent({
    required this.text,
    this.syllabic,
    this.extend,
  });

  final String text;
  final Syllabic? syllabic;
  final StartStopContinue? extend;

  SyllableContent copyWith({
    String? text,
    Syllabic? syllabic,
    StartStopContinue? extend,
  }) =>
      SyllableContent(
        text: text ?? this.text,
        syllabic: syllabic ?? this.syllabic,
        extend: extend ?? this.extend,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SyllableContent &&
          runtimeType == other.runtimeType &&
          text == other.text &&
          syllabic == other.syllabic &&
          extend == other.extend;

  @override
  int get hashCode => Object.hash(text, syllabic, extend);
}
