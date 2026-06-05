// Sealed class + subclasses must colocate in same library.
// ignore_for_file: one_class_per_file

import 'package:musicxml_domain/src/model/enums.dart';

/// Discriminated union for lyric element content.
sealed class LyricContent {
  const LyricContent();
}

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

/// Laughing lyric content.
final class LaughingContent extends LyricContent {
  const LaughingContent() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is LaughingContent;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// Humming lyric content.
final class HummingContent extends LyricContent {
  const HummingContent() : super();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is HummingContent;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// A lyric attached to a note.
final class Lyric {
  const Lyric({
    required this.content,
    this.number,
    this.name,
    this.endLine = false,
    this.endParagraph = false,
  });

  final LyricContent content;

  /// Lyric `number` attribute (e.g. '1', '2').
  final String? number;

  /// Lyric `name` attribute.
  final String? name;

  /// Whether an `end-line` element is present.
  final bool endLine;

  /// Whether an `end-paragraph` element is present.
  final bool endParagraph;

  Lyric copyWith({
    LyricContent? content,
    String? number,
    String? name,
    bool? endLine,
    bool? endParagraph,
  }) =>
      Lyric(
        content: content ?? this.content,
        number: number ?? this.number,
        name: name ?? this.name,
        endLine: endLine ?? this.endLine,
        endParagraph: endParagraph ?? this.endParagraph,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Lyric &&
          runtimeType == other.runtimeType &&
          content == other.content &&
          number == other.number &&
          name == other.name &&
          endLine == other.endLine &&
          endParagraph == other.endParagraph;

  @override
  int get hashCode =>
      Object.hash(content, number, name, endLine, endParagraph);
}
