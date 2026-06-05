import 'package:collection/collection.dart';
import 'package:musicxml_domain/src/model/display_pitch.dart';
import 'package:musicxml_domain/src/model/enums.dart';
import 'package:musicxml_domain/src/model/pitch.dart';

part 'note_content/pitched_note.dart';
part 'note_content/rest_note.dart';
part 'note_content/unpitched_note.dart';

sealed class NoteContent {
  const NoteContent();
}
