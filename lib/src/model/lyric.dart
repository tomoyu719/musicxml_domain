import 'package:musicxml_domain/src/model/lyric_content.dart';

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
