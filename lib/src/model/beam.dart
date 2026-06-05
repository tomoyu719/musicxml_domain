import 'package:musicxml_domain/src/model/enums.dart';

final class Beam {
  const Beam({required this.type, required this.number});

  final BeamType type;

  /// Beam number (1–8).
  final int number;

  Beam copyWith({BeamType? type, int? number}) =>
      Beam(type: type ?? this.type, number: number ?? this.number);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Beam &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number;

  @override
  int get hashCode => Object.hash(type, number);
}
