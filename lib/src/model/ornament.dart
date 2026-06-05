import 'package:musicxml_domain/src/model/enums.dart';

part 'ornament/trill_mark.dart';
part 'ornament/turn.dart';
part 'ornament/delayed_turn.dart';
part 'ornament/inverted_turn.dart';
part 'ornament/delayed_inverted_turn.dart';
part 'ornament/vertical_turn.dart';
part 'ornament/inverted_vertical_turn.dart';
part 'ornament/shake.dart';
part 'ornament/schleifer.dart';
part 'ornament/haydn.dart';
part 'ornament/wavy_line.dart';
part 'ornament/mordent.dart';
part 'ornament/inverted_mordent.dart';
part 'ornament/tremolo.dart';
part 'ornament/other_ornament.dart';
part 'ornament/accidental_mark.dart';

sealed class Ornament {
  const Ornament();
}
