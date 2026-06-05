import 'package:collection/collection.dart';
import 'package:musicxml_domain/src/model/enums.dart';

part 'key_signature/traditional_key.dart';
part 'key_signature/non_traditional_key.dart';
part 'key_signature/key_alteration.dart';

sealed class KeySignature {
  const KeySignature();
}
