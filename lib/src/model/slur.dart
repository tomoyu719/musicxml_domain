import 'package:musicxml_domain/src/model/enums.dart';

final class Slur {
  const Slur({required this.type, this.number, this.placement});

  final StartStopContinue type;
  final int? number;
  final Placement? placement;

  Slur copyWith({
    StartStopContinue? type,
    int? number,
    Placement? placement,
  }) =>
      Slur(
        type: type ?? this.type,
        number: number ?? this.number,
        placement: placement ?? this.placement,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Slur &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number &&
          placement == other.placement;

  @override
  int get hashCode => Object.hash(type, number, placement);
}
