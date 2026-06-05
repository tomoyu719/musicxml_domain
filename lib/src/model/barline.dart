import 'package:collection/collection.dart';
import 'package:musicxml_domain/src/model/enums.dart';
import 'package:musicxml_domain/src/model/fermata.dart';

part 'barline/repeat.dart';
part 'barline/ending.dart';

final class Barline {
  const Barline({
    this.location,
    this.barStyle,
    this.repeat,
    this.ending,
    this.fermatas = const [],
  });

  final BarlineLocation? location;
  final BarStyle? barStyle;
  final Repeat? repeat;
  final Ending? ending;
  final List<Fermata> fermatas;

  Barline copyWith({
    BarlineLocation? location,
    BarStyle? barStyle,
    Repeat? repeat,
    Ending? ending,
    List<Fermata>? fermatas,
  }) =>
      Barline(
        location: location ?? this.location,
        barStyle: barStyle ?? this.barStyle,
        repeat: repeat ?? this.repeat,
        ending: ending ?? this.ending,
        fermatas: fermatas ?? this.fermatas,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Barline &&
          runtimeType == other.runtimeType &&
          location == other.location &&
          barStyle == other.barStyle &&
          repeat == other.repeat &&
          ending == other.ending &&
          const ListEquality<Fermata>().equals(fermatas, other.fermatas);

  @override
  int get hashCode => Object.hashAll([
        location,
        barStyle,
        repeat,
        ending,
        const ListEquality<Fermata>().hash(fermatas),
      ]);
}
