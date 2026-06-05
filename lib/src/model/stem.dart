import 'package:musicxml_domain/src/model/enums.dart';

final class Stem {
  const Stem({required this.direction});

  final StemDirection direction;

  Stem copyWith({StemDirection? direction}) =>
      Stem(direction: direction ?? this.direction);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Stem &&
          runtimeType == other.runtimeType &&
          direction == other.direction;

  @override
  int get hashCode => direction.hashCode;
}
