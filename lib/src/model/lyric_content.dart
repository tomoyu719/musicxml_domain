import 'package:musicxml_domain/src/model/enums.dart';

part 'lyric_content/syllable_content.dart';
part 'lyric_content/extend_content.dart';
part 'lyric_content/laughing_content.dart';
part 'lyric_content/humming_content.dart';

/// Discriminated union for lyric element content.
sealed class LyricContent {
  const LyricContent();
}
