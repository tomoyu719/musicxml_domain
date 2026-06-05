import 'package:musicxml_domain/src/model/enums.dart';

final class Clef {
  const Clef({
    required this.sign,
    this.line,
    this.octaveChange,
    this.number,
    this.additional = false,
    this.afterBarline = false,
  });

  final ClefSign sign;
  final int? line;
  final int? octaveChange;
  final int? number;
  final bool additional;
  final bool afterBarline;

  Clef copyWith({
    ClefSign? sign,
    int? line,
    int? octaveChange,
    int? number,
    bool? additional,
    bool? afterBarline,
  }) =>
      Clef(
        sign: sign ?? this.sign,
        line: line ?? this.line,
        octaveChange: octaveChange ?? this.octaveChange,
        number: number ?? this.number,
        additional: additional ?? this.additional,
        afterBarline: afterBarline ?? this.afterBarline,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Clef &&
          runtimeType == other.runtimeType &&
          sign == other.sign &&
          line == other.line &&
          octaveChange == other.octaveChange &&
          number == other.number &&
          additional == other.additional &&
          afterBarline == other.afterBarline;

  @override
  int get hashCode =>
      Object.hash(sign, line, octaveChange, number, additional, afterBarline);
}
