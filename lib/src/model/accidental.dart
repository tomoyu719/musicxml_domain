import 'package:musicxml_domain/src/model/enums.dart';

final class Accidental {
  const Accidental({
    required this.type,
    this.cautionary = false,
    this.editorial = false,
  });

  final AccidentalType type;
  final bool cautionary;
  final bool editorial;

  Accidental copyWith({
    AccidentalType? type,
    bool? cautionary,
    bool? editorial,
  }) =>
      Accidental(
        type: type ?? this.type,
        cautionary: cautionary ?? this.cautionary,
        editorial: editorial ?? this.editorial,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Accidental &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          cautionary == other.cautionary &&
          editorial == other.editorial;

  @override
  int get hashCode => Object.hash(type, cautionary, editorial);
}
