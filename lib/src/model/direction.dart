import 'package:collection/collection.dart';
import 'package:musicxml_domain/src/model/direction_type.dart';
import 'package:musicxml_domain/src/model/enums.dart';

final class Direction {
  const Direction({
    required this.types,
    this.staff,
    this.offset,
    this.placement,
  });

  final List<DirectionType> types;
  final int? staff;
  final int? offset;
  final Placement? placement;

  Direction copyWith({
    List<DirectionType>? types,
    int? staff,
    int? offset,
    Placement? placement,
  }) =>
      Direction(
        types: types ?? this.types,
        staff: staff ?? this.staff,
        offset: offset ?? this.offset,
        placement: placement ?? this.placement,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Direction &&
          runtimeType == other.runtimeType &&
          const ListEquality<DirectionType>().equals(types, other.types) &&
          staff == other.staff &&
          offset == other.offset &&
          placement == other.placement;

  @override
  int get hashCode => Object.hashAll([
        const ListEquality<DirectionType>().hash(types),
        staff,
        offset,
        placement,
      ]);
}
