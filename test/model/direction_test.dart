import 'package:musicxml_domain/musicxml_domain.dart';
import 'package:test/test.dart';

void main() {
  // ─── Words ────────────────────────────────────────────────────────────────

  group('Words', () {
    const base = Words(text: 'allegro');

    test('lang defaults to null', () {
      expect(base.lang, isNull);
    });

    test('equality matches all fields', () {
      expect(base, const Words(text: 'allegro'));
      expect(base == const Words(text: 'largo'), isFalse);
      expect(base == const Words(text: 'allegro', lang: 'it'), isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const Words(text: 'allegro').hashCode);
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(lang: 'it'),
        const Words(text: 'allegro', lang: 'it'),
      );
      expect(base.copyWith(text: 'largo'), const Words(text: 'largo'));
    });
  });

  // ─── Metronome ────────────────────────────────────────────────────────────

  group('Metronome', () {
    const base = Metronome(beatUnit: NoteType.quarter, perMinute: '120');

    test('defaults beatUnitDots to 0 and parentheses to false', () {
      expect(base.beatUnitDots, 0);
      expect(base.parentheses, isFalse);
    });

    test('equality matches all fields', () {
      expect(base, const Metronome(beatUnit: NoteType.quarter, perMinute: '120'));
      expect(
        base == const Metronome(beatUnit: NoteType.half, perMinute: '120'),
        isFalse,
      );
      expect(
        base == const Metronome(beatUnit: NoteType.quarter, perMinute: '80'),
        isFalse,
      );
      expect(
        base ==
            const Metronome(
              beatUnit: NoteType.quarter,
              perMinute: '120',
              beatUnitDots: 1,
            ),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const Metronome(beatUnit: NoteType.quarter, perMinute: '120').hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(perMinute: '96'),
        const Metronome(beatUnit: NoteType.quarter, perMinute: '96'),
      );
      expect(
        base.copyWith(beatUnitDots: 1),
        const Metronome(
          beatUnit: NoteType.quarter,
          perMinute: '120',
          beatUnitDots: 1,
        ),
      );
      expect(
        base.copyWith(parentheses: true),
        const Metronome(
          beatUnit: NoteType.quarter,
          perMinute: '120',
          parentheses: true,
        ),
      );
    });
  });

  // ─── Wedge ────────────────────────────────────────────────────────────────

  group('Wedge', () {
    const base = Wedge(type: WedgeType.crescendo);

    test('number and spread default to null', () {
      expect(base.number, isNull);
      expect(base.spread, isNull);
    });

    test('equality matches all fields', () {
      expect(base, const Wedge(type: WedgeType.crescendo));
      expect(base == const Wedge(type: WedgeType.diminuendo), isFalse);
      expect(
        base == const Wedge(type: WedgeType.crescendo, number: 1),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const Wedge(type: WedgeType.crescendo).hashCode);
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(number: 1),
        const Wedge(type: WedgeType.crescendo, number: 1),
      );
      expect(
        base.copyWith(spread: 15.0),
        const Wedge(type: WedgeType.crescendo, spread: 15.0),
      );
    });
  });

  // ─── Dashes ───────────────────────────────────────────────────────────────

  group('Dashes', () {
    const base = Dashes(type: StartStopContinue.start);

    test('number defaults to null', () {
      expect(base.number, isNull);
    });

    test('equality matches all fields', () {
      expect(base, const Dashes(type: StartStopContinue.start));
      expect(base == const Dashes(type: StartStopContinue.stop), isFalse);
      expect(
        base == const Dashes(type: StartStopContinue.start, number: 1),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const Dashes(type: StartStopContinue.start).hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(type: StartStopContinue.stop),
        const Dashes(type: StartStopContinue.stop),
      );
      expect(
        base.copyWith(number: 2),
        const Dashes(type: StartStopContinue.start, number: 2),
      );
    });
  });

  // ─── Bracket ──────────────────────────────────────────────────────────────

  group('Bracket', () {
    const base = Bracket(
      type: StartStopContinue.start,
      lineEnd: LineEndType.none,
    );

    test('number and lineType default to null', () {
      expect(base.number, isNull);
      expect(base.lineType, isNull);
    });

    test('equality matches all fields', () {
      expect(
        base,
        const Bracket(
          type: StartStopContinue.start,
          lineEnd: LineEndType.none,
        ),
      );
      expect(
        base ==
            const Bracket(
              type: StartStopContinue.stop,
              lineEnd: LineEndType.none,
            ),
        isFalse,
      );
      expect(
        base ==
            const Bracket(
              type: StartStopContinue.start,
              lineEnd: LineEndType.up,
            ),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const Bracket(
          type: StartStopContinue.start,
          lineEnd: LineEndType.none,
        ).hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(lineType: LineType.dashed),
        const Bracket(
          type: StartStopContinue.start,
          lineEnd: LineEndType.none,
          lineType: LineType.dashed,
        ),
      );
      expect(
        base.copyWith(number: 1),
        const Bracket(
          type: StartStopContinue.start,
          lineEnd: LineEndType.none,
          number: 1,
        ),
      );
    });
  });

  // ─── Pedal ────────────────────────────────────────────────────────────────

  group('Pedal', () {
    const base = Pedal(type: PedalType.start);

    test('defaults number to null, line and sign to false', () {
      expect(base.number, isNull);
      expect(base.line, isFalse);
      expect(base.sign, isFalse);
    });

    test('equality matches all fields', () {
      expect(base, const Pedal(type: PedalType.start));
      expect(base == const Pedal(type: PedalType.stop), isFalse);
      expect(
        base == const Pedal(type: PedalType.start, line: true),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const Pedal(type: PedalType.start).hashCode);
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(line: true),
        const Pedal(type: PedalType.start, line: true),
      );
      expect(
        base.copyWith(sign: true),
        const Pedal(type: PedalType.start, sign: true),
      );
      expect(
        base.copyWith(number: 1),
        const Pedal(type: PedalType.start, number: 1),
      );
    });
  });

  // ─── OctaveShift ──────────────────────────────────────────────────────────

  group('OctaveShift', () {
    const base = OctaveShift(type: OctaveShiftType.up);

    test('defaults number to null and size to 8', () {
      expect(base.number, isNull);
      expect(base.size, 8);
    });

    test('equality matches all fields', () {
      expect(base, const OctaveShift(type: OctaveShiftType.up));
      expect(
        base == const OctaveShift(type: OctaveShiftType.down),
        isFalse,
      );
      expect(
        base == const OctaveShift(type: OctaveShiftType.up, size: 15),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const OctaveShift(type: OctaveShiftType.up).hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(size: 15),
        const OctaveShift(type: OctaveShiftType.up, size: 15),
      );
      expect(
        base.copyWith(number: 1),
        const OctaveShift(type: OctaveShiftType.up, number: 1),
      );
    });
  });

  // ─── DynamicsDirection ────────────────────────────────────────────────────

  group('DynamicsDirection', () {
    const base = DynamicsDirection();

    test('dynamics defaults to empty list', () {
      expect(base.dynamics, isEmpty);
    });

    test('equality uses list contents for dynamics', () {
      const a = DynamicsDirection(dynamics: [DynamicsType.f]);
      const b = DynamicsDirection(dynamics: [DynamicsType.f]);
      expect(a, b);
      expect(a == base, isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const DynamicsDirection().hashCode);
    });

    test('copyWith replaces dynamics', () {
      expect(
        base.copyWith(dynamics: [DynamicsType.pp]),
        const DynamicsDirection(dynamics: [DynamicsType.pp]),
      );
    });
  });

  // ─── DirectionType sealed exhaustiveness ──────────────────────────────────

  group('DirectionType sealed pattern match', () {
    test('all subtypes are exhaustively covered', () {
      final types = <DirectionType>[
        const Words(text: 'test'),
        const Metronome(beatUnit: NoteType.quarter, perMinute: '120'),
        const Wedge(type: WedgeType.crescendo),
        const Dashes(type: StartStopContinue.start),
        const Bracket(
          type: StartStopContinue.start,
          lineEnd: LineEndType.none,
        ),
        const Pedal(type: PedalType.start),
        const OctaveShift(type: OctaveShiftType.up),
        const DynamicsDirection(dynamics: [DynamicsType.mf]),
      ];

      for (final t in types) {
        final label = switch (t) {
          Words() => 'words',
          Metronome() => 'metronome',
          Wedge() => 'wedge',
          Dashes() => 'dashes',
          Bracket() => 'bracket',
          Pedal() => 'pedal',
          OctaveShift() => 'octave-shift',
          DynamicsDirection() => 'dynamics',
        };
        expect(label, isNotEmpty);
      }
    });
  });

  // ─── Direction ────────────────────────────────────────────────────────────

  group('Direction', () {
    const base = Direction(types: [Words(text: 'allegro')]);

    test('staff, offset, placement default to null', () {
      expect(base.staff, isNull);
      expect(base.offset, isNull);
      expect(base.placement, isNull);
    });

    test('equality matches all fields', () {
      expect(base, const Direction(types: [Words(text: 'allegro')]));
      expect(
        base == const Direction(types: [Words(text: 'largo')]),
        isFalse,
      );
      expect(
        base ==
            const Direction(
              types: [Words(text: 'allegro')],
              placement: Placement.above,
            ),
        isFalse,
      );
    });

    test('equality uses list contents for types', () {
      const a = Direction(
        types: [Words(text: 'a'), Wedge(type: WedgeType.crescendo)],
      );
      const b = Direction(
        types: [Words(text: 'a'), Wedge(type: WedgeType.crescendo)],
      );
      expect(a, b);
      expect(a == base, isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const Direction(types: [Words(text: 'allegro')]).hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(placement: Placement.below),
        const Direction(
          types: [Words(text: 'allegro')],
          placement: Placement.below,
        ),
      );
      expect(
        base.copyWith(staff: 2),
        const Direction(types: [Words(text: 'allegro')], staff: 2),
      );
      expect(
        base.copyWith(offset: 8),
        const Direction(types: [Words(text: 'allegro')], offset: 8),
      );
    });
  });
}
