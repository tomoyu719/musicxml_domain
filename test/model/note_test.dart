import 'package:musicxml_domain/musicxml_domain.dart';
import 'package:test/test.dart';

void main() {
  group('GraceInfo', () {
    const base = GraceInfo();

    test('defaults slash to false', () {
      expect(base.slash, isFalse);
    });

    test('equality matches slash field', () {
      expect(base, const GraceInfo());
      expect(base == const GraceInfo(slash: true), isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const GraceInfo().hashCode);
    });

    test('copyWith replaces slash', () {
      expect(base.copyWith(slash: true), const GraceInfo(slash: true));
    });
  });

  group('TimeModification', () {
    const base = TimeModification(actualNotes: 3, normalNotes: 2);

    test('defaults normalDots to 0', () {
      expect(base.normalDots, 0);
    });

    test('equality matches all fields', () {
      expect(base, const TimeModification(actualNotes: 3, normalNotes: 2));
      expect(
        base == const TimeModification(actualNotes: 5, normalNotes: 4),
        isFalse,
      );
      expect(
        base ==
            const TimeModification(
              actualNotes: 3,
              normalNotes: 2,
              normalType: NoteType.eighth,
            ),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const TimeModification(actualNotes: 3, normalNotes: 2).hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(normalType: NoteType.quarter),
        const TimeModification(
          actualNotes: 3,
          normalNotes: 2,
          normalType: NoteType.quarter,
        ),
      );
      expect(
        base.copyWith(normalDots: 1),
        const TimeModification(
          actualNotes: 3,
          normalNotes: 2,
          normalDots: 1,
        ),
      );
    });
  });

  group('Beam', () {
    const base = Beam(type: BeamType.begin, number: 1);

    test('equality matches all fields', () {
      expect(base, const Beam(type: BeamType.begin, number: 1));
      expect(base == const Beam(type: BeamType.end, number: 1), isFalse);
      expect(base == const Beam(type: BeamType.begin, number: 2), isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const Beam(type: BeamType.begin, number: 1).hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(type: BeamType.end),
        const Beam(type: BeamType.end, number: 1),
      );
      expect(
        base.copyWith(number: 2),
        const Beam(type: BeamType.begin, number: 2),
      );
    });
  });

  group('Accidental', () {
    const base = Accidental(type: AccidentalType.sharp);

    test('defaults cautionary and editorial to false', () {
      expect(base.cautionary, isFalse);
      expect(base.editorial, isFalse);
    });

    test('equality matches all fields', () {
      expect(base, const Accidental(type: AccidentalType.sharp));
      expect(
        base == const Accidental(type: AccidentalType.flat),
        isFalse,
      );
      expect(
        base == const Accidental(type: AccidentalType.sharp, cautionary: true),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const Accidental(type: AccidentalType.sharp).hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(cautionary: true),
        const Accidental(type: AccidentalType.sharp, cautionary: true),
      );
      expect(
        base.copyWith(editorial: true),
        const Accidental(type: AccidentalType.sharp, editorial: true),
      );
    });
  });

  group('Stem', () {
    const base = Stem(direction: StemDirection.up);

    test('equality matches direction', () {
      expect(base, const Stem(direction: StemDirection.up));
      expect(base == const Stem(direction: StemDirection.down), isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const Stem(direction: StemDirection.up).hashCode,
      );
    });

    test('copyWith replaces direction', () {
      expect(
        base.copyWith(direction: StemDirection.down),
        const Stem(direction: StemDirection.down),
      );
    });
  });

  group('Notehead', () {
    const base = Notehead(type: NoteheadType.normal);
    const withFilled = Notehead(type: NoteheadType.normal, filled: true);

    test('equality matches all fields', () {
      expect(base, const Notehead(type: NoteheadType.normal));
      expect(base == withFilled, isFalse);
      expect(
        base == const Notehead(type: NoteheadType.diamond),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const Notehead(type: NoteheadType.normal).hashCode);
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(filled: false),
        const Notehead(type: NoteheadType.normal, filled: false),
      );
      expect(
        base.copyWith(parentheses: true),
        const Notehead(type: NoteheadType.normal, parentheses: true),
      );
    });
  });

  // ─── NoteContent sealed class ────────────────────────────────────────────

  group('PitchedNote', () {
    const pitch = Pitch(step: Step.c, octave: 4);
    const base = PitchedNote(pitch: pitch, duration: 4);

    test('defaults ties to empty list', () {
      expect(base.ties, isEmpty);
    });

    test('equality matches all fields', () {
      expect(base, const PitchedNote(pitch: pitch, duration: 4));
      expect(base == const PitchedNote(pitch: pitch, duration: 2), isFalse);
    });

    test('equality uses list contents for ties', () {
      const a = PitchedNote(
        pitch: pitch,
        duration: 4,
        ties: [TieType.start],
      );
      const b = PitchedNote(
        pitch: pitch,
        duration: 4,
        ties: [TieType.start],
      );
      expect(a, b);
      expect(a == base, isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const PitchedNote(pitch: pitch, duration: 4).hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      const otherPitch = Pitch(step: Step.d, octave: 4);
      expect(
        base.copyWith(pitch: otherPitch),
        const PitchedNote(pitch: otherPitch, duration: 4),
      );
      expect(
        base.copyWith(ties: [TieType.start]),
        const PitchedNote(pitch: pitch, duration: 4, ties: [TieType.start]),
      );
    });
  });

  group('RestNote', () {
    const base = RestNote(duration: 4);

    test('defaults measureRest to false', () {
      expect(base.measureRest, isFalse);
    });

    test('equality matches all fields', () {
      expect(base, const RestNote(duration: 4));
      expect(base == const RestNote(duration: 2), isFalse);
      expect(base == const RestNote(duration: 4, measureRest: true), isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const RestNote(duration: 4).hashCode);
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(measureRest: true),
        const RestNote(duration: 4, measureRest: true),
      );
      const dp = DisplayPitch(displayStep: Step.b, displayOctave: 4);
      expect(
        base.copyWith(displayPitch: dp),
        const RestNote(duration: 4, displayPitch: dp),
      );
    });
  });

  group('UnpitchedNote', () {
    const base = UnpitchedNote(duration: 4);

    test('equality matches all fields', () {
      expect(base, const UnpitchedNote(duration: 4));
      expect(base == const UnpitchedNote(duration: 2), isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const UnpitchedNote(duration: 4).hashCode);
    });

    test('copyWith replaces displayPitch', () {
      const dp = DisplayPitch(displayStep: Step.e, displayOctave: 5);
      expect(
        base.copyWith(displayPitch: dp),
        const UnpitchedNote(duration: 4, displayPitch: dp),
      );
    });
  });

  group('NoteContent sealed pattern match', () {
    test('all subtypes are exhaustively covered', () {
      const pitch = Pitch(step: Step.a, octave: 4);
      final contents = <NoteContent>[
        const PitchedNote(pitch: pitch, duration: 4),
        const RestNote(duration: 4),
        const UnpitchedNote(duration: 4),
      ];

      for (final c in contents) {
        final label = switch (c) {
          PitchedNote() => 'pitched',
          RestNote() => 'rest',
          UnpitchedNote() => 'unpitched',
        };
        expect(label, isNotEmpty);
      }
    });
  });

  // ─── Note ──────────────────────────────────────────────────────────────────

  group('Note', () {
    const pitch = Pitch(step: Step.g, octave: 4);
    const content = PitchedNote(pitch: pitch, duration: 4);
    const base = Note(content: content);

    test('defaults dots to 0, chord to false, beams and lyrics to []', () {
      expect(base.dots, 0);
      expect(base.chord, isFalse);
      expect(base.beams, isEmpty);
      expect(base.lyrics, isEmpty);
    });

    test('equality matches content', () {
      expect(base, const Note(content: content));
      expect(
        base ==
            const Note(content: RestNote(duration: 4)),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const Note(content: content).hashCode);
    });

    test('equality uses list contents for beams', () {
      const a = Note(
        content: content,
        beams: [Beam(type: BeamType.begin, number: 1)],
      );
      const b = Note(
        content: content,
        beams: [Beam(type: BeamType.begin, number: 1)],
      );
      expect(a, b);
      expect(a == base, isFalse);
    });

    test('equality uses list contents for lyrics', () {
      const syllable = SyllableContent(text: 'la');
      const a = Note(
        content: content,
        lyrics: [Lyric(content: syllable)],
      );
      const b = Note(
        content: content,
        lyrics: [Lyric(content: syllable)],
      );
      expect(a, b);
      expect(a == base, isFalse);
    });

    test('notations is nullable', () {
      expect(base.notations, isNull);
      const withNotations = Note(
        content: content,
        notations: Notations(fermatas: [Fermata()]),
      );
      expect(withNotations.notations, isNotNull);
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(dots: 1),
        const Note(content: content, dots: 1),
      );
      expect(
        base.copyWith(voice: '1'),
        const Note(content: content, voice: '1'),
      );
      expect(
        base.copyWith(chord: true),
        const Note(content: content, chord: true),
      );
      expect(
        base.copyWith(type: NoteType.quarter),
        const Note(content: content, type: NoteType.quarter),
      );
      expect(
        base.copyWith(grace: const GraceInfo(slash: true)),
        const Note(content: content, grace: GraceInfo(slash: true)),
      );
    });

    test('copyWith replaces stem', () {
      expect(
        base.copyWith(stem: const Stem(direction: StemDirection.up)),
        const Note(content: content, stem: Stem(direction: StemDirection.up)),
      );
    });

    test('copyWith replaces beams list', () {
      const beam = Beam(type: BeamType.begin, number: 1);
      expect(
        base.copyWith(beams: [beam]),
        const Note(content: content, beams: [beam]),
      );
    });
  });
}
