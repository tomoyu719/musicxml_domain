import 'package:collection/collection.dart';
import 'package:musicxml_domain/src/model/enums.dart';

final class Dynamics {
  const Dynamics({this.types = const []});

  final List<DynamicsType> types;

  Dynamics copyWith({List<DynamicsType>? types}) =>
      Dynamics(types: types ?? this.types);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Dynamics &&
          runtimeType == other.runtimeType &&
          const ListEquality<DynamicsType>().equals(types, other.types);

  @override
  int get hashCode => const ListEquality<DynamicsType>().hash(types);
}
