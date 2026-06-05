import 'package:collection/collection.dart';
import 'package:musicxml_domain/src/model/clef.dart';
import 'package:musicxml_domain/src/model/key_signature.dart';
import 'package:musicxml_domain/src/model/time_signature.dart';

final class Attributes {
  const Attributes({
    this.divisions,
    this.keys = const [],
    this.times = const [],
    this.staves,
    this.clefs = const [],
  });

  final int? divisions;
  final List<KeySignature> keys;
  final List<TimeSignature> times;
  final int? staves;
  final List<Clef> clefs;

  Attributes copyWith({
    int? divisions,
    List<KeySignature>? keys,
    List<TimeSignature>? times,
    int? staves,
    List<Clef>? clefs,
  }) =>
      Attributes(
        divisions: divisions ?? this.divisions,
        keys: keys ?? this.keys,
        times: times ?? this.times,
        staves: staves ?? this.staves,
        clefs: clefs ?? this.clefs,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Attributes &&
          runtimeType == other.runtimeType &&
          divisions == other.divisions &&
          const ListEquality<KeySignature>().equals(keys, other.keys) &&
          const ListEquality<TimeSignature>().equals(times, other.times) &&
          staves == other.staves &&
          const ListEquality<Clef>().equals(clefs, other.clefs);

  @override
  int get hashCode => Object.hashAll([
        divisions,
        const ListEquality<KeySignature>().hash(keys),
        const ListEquality<TimeSignature>().hash(times),
        staves,
        const ListEquality<Clef>().hash(clefs),
      ]);
}
