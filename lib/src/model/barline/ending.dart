part of '../barline.dart';

final class Ending {
  const Ending({
    required this.number,
    required this.type,
    this.text,
    this.printObject = true,
  });

  final String number;
  final StartStopDiscontinue type;
  final String? text;
  final bool printObject;

  Ending copyWith({
    String? number,
    StartStopDiscontinue? type,
    String? text,
    bool? printObject,
  }) =>
      Ending(
        number: number ?? this.number,
        type: type ?? this.type,
        text: text ?? this.text,
        printObject: printObject ?? this.printObject,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ending &&
          runtimeType == other.runtimeType &&
          number == other.number &&
          type == other.type &&
          text == other.text &&
          printObject == other.printObject;

  @override
  int get hashCode => Object.hash(number, type, text, printObject);
}
