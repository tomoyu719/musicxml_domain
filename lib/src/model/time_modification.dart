import 'package:musicxml_domain/src/model/enums.dart';

final class TimeModification {
  const TimeModification({
    required this.actualNotes,
    required this.normalNotes,
    this.normalType,
    this.normalDots = 0,
  });

  final int actualNotes;
  final int normalNotes;
  final NoteType? normalType;
  final int normalDots;

  TimeModification copyWith({
    int? actualNotes,
    int? normalNotes,
    NoteType? normalType,
    int? normalDots,
  }) =>
      TimeModification(
        actualNotes: actualNotes ?? this.actualNotes,
        normalNotes: normalNotes ?? this.normalNotes,
        normalType: normalType ?? this.normalType,
        normalDots: normalDots ?? this.normalDots,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeModification &&
          runtimeType == other.runtimeType &&
          actualNotes == other.actualNotes &&
          normalNotes == other.normalNotes &&
          normalType == other.normalType &&
          normalDots == other.normalDots;

  @override
  int get hashCode =>
      Object.hash(actualNotes, normalNotes, normalType, normalDots);
}
