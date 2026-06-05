import 'package:musicxml_domain/src/model/enums.dart';

final class Tied {
  const Tied({required this.type, this.number});

  final TiedType type;
  final int? number;

  Tied copyWith({TiedType? type, int? number}) =>
      Tied(type: type ?? this.type, number: number ?? this.number);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tied &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          number == other.number;

  @override
  int get hashCode => Object.hash(type, number);
}
