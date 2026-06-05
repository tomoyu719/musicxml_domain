import 'package:musicxml_domain/src/model/enums.dart';

final class Fermata {
  const Fermata({this.shape, this.inverted = false});

  final FermataShape? shape;
  final bool inverted;

  Fermata copyWith({FermataShape? shape, bool? inverted}) => Fermata(
        shape: shape ?? this.shape,
        inverted: inverted ?? this.inverted,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Fermata &&
          runtimeType == other.runtimeType &&
          shape == other.shape &&
          inverted == other.inverted;

  @override
  int get hashCode => Object.hash(shape, inverted);
}
