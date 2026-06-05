import 'package:collection/collection.dart';
import 'package:musicxml_domain/src/model/enums.dart';

part 'harmony/harmony_root.dart';
part 'harmony/harmony_kind.dart';
part 'harmony/harmony_degree.dart';

final class Harmony {
  const Harmony({
    required this.root,
    required this.kind,
    this.bass,
    this.inversion,
    this.degrees = const [],
    this.offset,
    this.staff,
    this.type,
  });

  final HarmonyRoot root;
  final HarmonyKind kind;
  final HarmonyRoot? bass;
  final int? inversion;
  final List<HarmonyDegree> degrees;
  final int? offset;
  final int? staff;
  final HarmonyType? type;

  Harmony copyWith({
    HarmonyRoot? root,
    HarmonyKind? kind,
    HarmonyRoot? bass,
    int? inversion,
    List<HarmonyDegree>? degrees,
    int? offset,
    int? staff,
    HarmonyType? type,
  }) =>
      Harmony(
        root: root ?? this.root,
        kind: kind ?? this.kind,
        bass: bass ?? this.bass,
        inversion: inversion ?? this.inversion,
        degrees: degrees ?? this.degrees,
        offset: offset ?? this.offset,
        staff: staff ?? this.staff,
        type: type ?? this.type,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Harmony &&
          runtimeType == other.runtimeType &&
          root == other.root &&
          kind == other.kind &&
          bass == other.bass &&
          inversion == other.inversion &&
          const ListEquality<HarmonyDegree>().equals(degrees, other.degrees) &&
          offset == other.offset &&
          staff == other.staff &&
          type == other.type;

  @override
  int get hashCode => Object.hashAll([
        root,
        kind,
        bass,
        inversion,
        const ListEquality<HarmonyDegree>().hash(degrees),
        offset,
        staff,
        type,
      ]);
}
