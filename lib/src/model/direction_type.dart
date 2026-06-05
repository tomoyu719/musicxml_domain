import 'package:collection/collection.dart';
import 'package:musicxml_domain/src/model/enums.dart';

part 'direction_type/words.dart';
part 'direction_type/metronome.dart';
part 'direction_type/wedge.dart';
part 'direction_type/dashes.dart';
part 'direction_type/bracket.dart';
part 'direction_type/pedal.dart';
part 'direction_type/octave_shift.dart';
part 'direction_type/dynamics_direction.dart';

sealed class DirectionType {
  const DirectionType();
}
