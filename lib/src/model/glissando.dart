import 'package:musicxml_domain/src/model/enums.dart';

final class Glissando {
  const Glissando({
    required this.type,
    this.number,
    this.lineType,
    this.text,
  });

  final StartStop type;
  final int? number;
  final LineType? lineType;
  final String? text;

  Glissando copyWith({
    StartStop? type,
    int? number,
    LineType? lineType,
    String? text,
  }) =>
      Glissando(
        type: type ?? this.type,
        number: number ?? this.number,
        lineType: lineType ?? this.lineType,
        text: text ?? this.text,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Glissando &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number &&
          lineType == other.lineType &&
          text == other.text;

  @override
  int get hashCode => Object.hash(type, number, lineType, text);
}
