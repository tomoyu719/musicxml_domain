import 'package:musicxml_domain/src/model/enums.dart';

final class Slide {
  const Slide({required this.type, this.number, this.lineType});

  final StartStop type;
  final int? number;
  final LineType? lineType;

  Slide copyWith({StartStop? type, int? number, LineType? lineType}) => Slide(
        type: type ?? this.type,
        number: number ?? this.number,
        lineType: lineType ?? this.lineType,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Slide &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number &&
          lineType == other.lineType;

  @override
  int get hashCode => Object.hash(type, number, lineType);
}
