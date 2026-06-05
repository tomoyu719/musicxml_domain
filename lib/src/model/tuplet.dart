import 'package:musicxml_domain/src/model/enums.dart';

final class Tuplet {
  const Tuplet({
    required this.type,
    this.number,
    this.bracket,
    this.showNumber,
    this.showType,
  });

  final StartStop type;
  final int? number;
  final bool? bracket;
  final ShowTuplet? showNumber;
  final ShowTuplet? showType;

  Tuplet copyWith({
    StartStop? type,
    int? number,
    bool? bracket,
    ShowTuplet? showNumber,
    ShowTuplet? showType,
  }) =>
      Tuplet(
        type: type ?? this.type,
        number: number ?? this.number,
        bracket: bracket ?? this.bracket,
        showNumber: showNumber ?? this.showNumber,
        showType: showType ?? this.showType,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tuplet &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number &&
          bracket == other.bracket &&
          showNumber == other.showNumber &&
          showType == other.showType;

  @override
  int get hashCode => Object.hash(type, number, bracket, showNumber, showType);
}
