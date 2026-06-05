part of '../direction_type.dart';

final class Words extends DirectionType {
  const Words({required this.text, this.lang});

  final String text;
  final String? lang;

  Words copyWith({String? text, String? lang}) =>
      Words(text: text ?? this.text, lang: lang ?? this.lang);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Words &&
          runtimeType == other.runtimeType &&
          text == other.text &&
          lang == other.lang;

  @override
  int get hashCode => Object.hash(text, lang);
}
