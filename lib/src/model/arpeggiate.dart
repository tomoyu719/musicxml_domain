import 'package:musicxml_domain/src/model/enums.dart';

final class Arpeggiate {
  const Arpeggiate({this.direction, this.unison});

  final ArpeggiateDirection? direction;
  final bool? unison;

  Arpeggiate copyWith({ArpeggiateDirection? direction, bool? unison}) =>
      Arpeggiate(
        direction: direction ?? this.direction,
        unison: unison ?? this.unison,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Arpeggiate &&
          runtimeType == other.runtimeType &&
          direction == other.direction &&
          unison == other.unison;

  @override
  int get hashCode => Object.hash(direction, unison);
}
