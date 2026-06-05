import 'package:musicxml_domain/musicxml_domain.dart';
import 'package:test/test.dart';

void main() {
  // ─── Clef ─────────────────────────────────────────────────────────────────

  group('Clef', () {
    const base = Clef(sign: ClefSign.g);

    test('defaults line, octaveChange, number to null and flags to false', () {
      expect(base.line, isNull);
      expect(base.octaveChange, isNull);
      expect(base.number, isNull);
      expect(base.additional, isFalse);
      expect(base.afterBarline, isFalse);
    });

    test('equality matches all fields', () {
      expect(base, const Clef(sign: ClefSign.g));
      expect(base == const Clef(sign: ClefSign.f), isFalse);
      expect(base == const Clef(sign: ClefSign.g, line: 2), isFalse);
      expect(
        base == const Clef(sign: ClefSign.g, additional: true),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const Clef(sign: ClefSign.g).hashCode);
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(line: 2),
        const Clef(sign: ClefSign.g, line: 2),
      );
      expect(
        base.copyWith(sign: ClefSign.f, line: 4),
        const Clef(sign: ClefSign.f, line: 4),
      );
      expect(
        base.copyWith(octaveChange: -1),
        const Clef(sign: ClefSign.g, octaveChange: -1),
      );
      expect(
        base.copyWith(number: 2),
        const Clef(sign: ClefSign.g, number: 2),
      );
      expect(
        base.copyWith(additional: true),
        const Clef(sign: ClefSign.g, additional: true),
      );
      expect(
        base.copyWith(afterBarline: true),
        const Clef(sign: ClefSign.g, afterBarline: true),
      );
    });
  });

  // ─── KeyAlteration ────────────────────────────────────────────────────────

  group('KeyAlteration', () {
    const base = KeyAlteration(step: Step.c, alter: 0.5);

    test('accidental defaults to null', () {
      expect(base.accidental, isNull);
    });

    test('equality matches all fields', () {
      expect(base, const KeyAlteration(step: Step.c, alter: 0.5));
      expect(base == const KeyAlteration(step: Step.d, alter: 0.5), isFalse);
      expect(base == const KeyAlteration(step: Step.c, alter: -0.5), isFalse);
      expect(
        base ==
            const KeyAlteration(
              step: Step.c,
              alter: 0.5,
              accidental: AccidentalType.quarterSharp,
            ),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const KeyAlteration(step: Step.c, alter: 0.5).hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(step: Step.d),
        const KeyAlteration(step: Step.d, alter: 0.5),
      );
      expect(
        base.copyWith(accidental: AccidentalType.quarterSharp),
        const KeyAlteration(
          step: Step.c,
          alter: 0.5,
          accidental: AccidentalType.quarterSharp,
        ),
      );
    });
  });

  // ─── TraditionalKey ───────────────────────────────────────────────────────

  group('TraditionalKey', () {
    const base = TraditionalKey(fifths: 2);

    test('defaults mode and number to null', () {
      expect(base.mode, isNull);
      expect(base.number, isNull);
    });

    test('equality matches all fields', () {
      expect(base, const TraditionalKey(fifths: 2));
      expect(base == const TraditionalKey(fifths: -1), isFalse);
      expect(
        base == const TraditionalKey(fifths: 2, mode: KeyMode.major),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const TraditionalKey(fifths: 2).hashCode);
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(mode: KeyMode.minor),
        const TraditionalKey(fifths: 2, mode: KeyMode.minor),
      );
      expect(
        base.copyWith(fifths: -3),
        const TraditionalKey(fifths: -3),
      );
      expect(
        base.copyWith(number: 1),
        const TraditionalKey(fifths: 2, number: 1),
      );
    });
  });

  // ─── NonTraditionalKey ────────────────────────────────────────────────────

  group('NonTraditionalKey', () {
    const base = NonTraditionalKey();

    test('defaults alterations to empty list and number to null', () {
      expect(base.alterations, isEmpty);
      expect(base.number, isNull);
    });

    test('equality matches all fields', () {
      expect(base, const NonTraditionalKey());
      expect(
        base ==
            const NonTraditionalKey(
              alterations: [KeyAlteration(step: Step.c, alter: 1.0)],
            ),
        isFalse,
      );
      expect(base == const NonTraditionalKey(number: 2), isFalse);
    });

    test('equality uses list contents for alterations', () {
      const a = NonTraditionalKey(
        alterations: [KeyAlteration(step: Step.f, alter: -1.0)],
      );
      const b = NonTraditionalKey(
        alterations: [KeyAlteration(step: Step.f, alter: -1.0)],
      );
      expect(a, b);
      expect(a == base, isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const NonTraditionalKey().hashCode);
    });

    test('copyWith replaces individual fields', () {
      const alt = KeyAlteration(step: Step.b, alter: -0.5);
      expect(
        base.copyWith(alterations: [alt]),
        const NonTraditionalKey(alterations: [alt]),
      );
      expect(
        base.copyWith(number: 1),
        const NonTraditionalKey(number: 1),
      );
    });
  });

  // ─── KeySignature sealed exhaustiveness ───────────────────────────────────

  group('KeySignature sealed pattern match', () {
    test('all subtypes are exhaustively covered', () {
      final keys = <KeySignature>[
        const TraditionalKey(fifths: 0),
        const NonTraditionalKey(),
      ];

      for (final k in keys) {
        final label = switch (k) {
          TraditionalKey() => 'traditional',
          NonTraditionalKey() => 'non-traditional',
        };
        expect(label, isNotEmpty);
      }
    });
  });

  // ─── MeterTime ────────────────────────────────────────────────────────────

  group('MeterTime', () {
    const base = MeterTime(beats: '4', beatType: 4);

    test('defaults number and symbol to null', () {
      expect(base.number, isNull);
      expect(base.symbol, isNull);
    });

    test('equality matches all fields', () {
      expect(base, const MeterTime(beats: '4', beatType: 4));
      expect(
        base == const MeterTime(beats: '3', beatType: 4),
        isFalse,
      );
      expect(
        base == const MeterTime(beats: '4', beatType: 2),
        isFalse,
      );
      expect(
        base ==
            const MeterTime(
              beats: '4',
              beatType: 4,
              symbol: TimeSymbol.common,
            ),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const MeterTime(beats: '4', beatType: 4).hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(beats: '3'),
        const MeterTime(beats: '3', beatType: 4),
      );
      expect(
        base.copyWith(beatType: 8),
        const MeterTime(beats: '4', beatType: 8),
      );
      expect(
        base.copyWith(symbol: TimeSymbol.cut),
        const MeterTime(beats: '4', beatType: 4, symbol: TimeSymbol.cut),
      );
      expect(
        base.copyWith(number: 1),
        const MeterTime(beats: '4', beatType: 4, number: 1),
      );
    });
  });

  // ─── SenzaMisura ──────────────────────────────────────────────────────────

  group('SenzaMisura', () {
    const base = SenzaMisura();

    test('number defaults to null', () {
      expect(base.number, isNull);
    });

    test('equality matches number', () {
      expect(base, const SenzaMisura());
      expect(base == const SenzaMisura(number: 1), isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const SenzaMisura().hashCode);
    });

    test('copyWith replaces number', () {
      expect(base.copyWith(number: 2), const SenzaMisura(number: 2));
    });
  });

  // ─── TimeSignature sealed exhaustiveness ──────────────────────────────────

  group('TimeSignature sealed pattern match', () {
    test('all subtypes are exhaustively covered', () {
      final times = <TimeSignature>[
        const MeterTime(beats: '4', beatType: 4),
        const SenzaMisura(),
      ];

      for (final t in times) {
        final label = switch (t) {
          MeterTime() => 'meter',
          SenzaMisura() => 'senza-misura',
        };
        expect(label, isNotEmpty);
      }
    });
  });

  // ─── Attributes ───────────────────────────────────────────────────────────

  group('Attributes', () {
    const base = Attributes();

    test('all fields default to null or empty list', () {
      expect(base.divisions, isNull);
      expect(base.staves, isNull);
      expect(base.keys, isEmpty);
      expect(base.times, isEmpty);
      expect(base.clefs, isEmpty);
    });

    test('equality matches all fields', () {
      expect(base, const Attributes());
      expect(base == const Attributes(divisions: 4), isFalse);
      expect(base == const Attributes(staves: 2), isFalse);
    });

    test('equality uses list contents for keys', () {
      const a = Attributes(
        keys: [TraditionalKey(fifths: 0)],
      );
      const b = Attributes(
        keys: [TraditionalKey(fifths: 0)],
      );
      expect(a, b);
      expect(a == base, isFalse);
    });

    test('equality uses list contents for times', () {
      const a = Attributes(
        times: [MeterTime(beats: '4', beatType: 4)],
      );
      const b = Attributes(
        times: [MeterTime(beats: '4', beatType: 4)],
      );
      expect(a, b);
      expect(a == base, isFalse);
    });

    test('equality uses list contents for clefs', () {
      const a = Attributes(clefs: [Clef(sign: ClefSign.g)]);
      const b = Attributes(clefs: [Clef(sign: ClefSign.g)]);
      expect(a, b);
      expect(a == base, isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const Attributes().hashCode);
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(divisions: 8),
        const Attributes(divisions: 8),
      );
      expect(
        base.copyWith(staves: 2),
        const Attributes(staves: 2),
      );
      expect(
        base.copyWith(clefs: [const Clef(sign: ClefSign.f)]),
        const Attributes(clefs: [Clef(sign: ClefSign.f)]),
      );
    });
  });
}
