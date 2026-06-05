import 'package:musicxml_domain/src/model/enums.dart';

final class Notehead {
  const Notehead({required this.type, this.filled, this.parentheses});

  final NoteheadType type;
  final bool? filled;
  final bool? parentheses;

  Notehead copyWith({
    NoteheadType? type,
    bool? filled,
    bool? parentheses,
  }) =>
      Notehead(
        type: type ?? this.type,
        filled: filled ?? this.filled,
        parentheses: parentheses ?? this.parentheses,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Notehead &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          filled == other.filled &&
          parentheses == other.parentheses;

  @override
  int get hashCode => Object.hash(type, filled, parentheses);
}
