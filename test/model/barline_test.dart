import 'package:musicxml_domain/musicxml_domain.dart';
import 'package:test/test.dart';

void main() {
  // ─── Repeat ───────────────────────────────────────────────────────────────

  group('Repeat', () {
    const base = Repeat(direction: RepeatDirection.forward);

    test('times and winged default to null', () {
      expect(base.times, isNull);
      expect(base.winged, isNull);
    });

    test('equality matches all fields', () {
      expect(base, const Repeat(direction: RepeatDirection.forward));
      expect(
        base == const Repeat(direction: RepeatDirection.backward),
        isFalse,
      );
      expect(
        base == const Repeat(direction: RepeatDirection.forward, times: 2),
        isFalse,
      );
      expect(
        base ==
            const Repeat(
              direction: RepeatDirection.forward,
              winged: WingedType.straight,
            ),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const Repeat(direction: RepeatDirection.forward).hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(times: 3),
        const Repeat(direction: RepeatDirection.forward, times: 3),
      );
      expect(
        base.copyWith(winged: WingedType.curved),
        const Repeat(
          direction: RepeatDirection.forward,
          winged: WingedType.curved,
        ),
      );
      expect(
        base.copyWith(direction: RepeatDirection.backward),
        const Repeat(direction: RepeatDirection.backward),
      );
    });
  });

  // ─── Ending ───────────────────────────────────────────────────────────────

  group('Ending', () {
    const base = Ending(
      number: '1',
      type: StartStopDiscontinue.start,
    );

    test('text defaults to null and printObject to true', () {
      expect(base.text, isNull);
      expect(base.printObject, isTrue);
    });

    test('equality matches all fields', () {
      expect(
        base,
        const Ending(number: '1', type: StartStopDiscontinue.start),
      );
      expect(
        base ==
            const Ending(number: '2', type: StartStopDiscontinue.start),
        isFalse,
      );
      expect(
        base ==
            const Ending(number: '1', type: StartStopDiscontinue.stop),
        isFalse,
      );
      expect(
        base ==
            const Ending(
              number: '1',
              type: StartStopDiscontinue.start,
              text: '1.',
            ),
        isFalse,
      );
      expect(
        base ==
            const Ending(
              number: '1',
              type: StartStopDiscontinue.start,
              printObject: false,
            ),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const Ending(
          number: '1',
          type: StartStopDiscontinue.start,
        ).hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(number: '1,2'),
        const Ending(number: '1,2', type: StartStopDiscontinue.start),
      );
      expect(
        base.copyWith(type: StartStopDiscontinue.stop),
        const Ending(number: '1', type: StartStopDiscontinue.stop),
      );
      expect(
        base.copyWith(text: '1.'),
        const Ending(
          number: '1',
          type: StartStopDiscontinue.start,
          text: '1.',
        ),
      );
      expect(
        base.copyWith(printObject: false),
        const Ending(
          number: '1',
          type: StartStopDiscontinue.start,
          printObject: false,
        ),
      );
    });
  });

  // ─── Barline ──────────────────────────────────────────────────────────────

  group('Barline', () {
    const base = Barline();

    test('all fields default to null or empty', () {
      expect(base.location, isNull);
      expect(base.barStyle, isNull);
      expect(base.repeat, isNull);
      expect(base.ending, isNull);
      expect(base.fermatas, isEmpty);
    });

    test('equality matches all fields', () {
      expect(base, const Barline());
      expect(
        base == const Barline(location: BarlineLocation.left),
        isFalse,
      );
      expect(
        base == const Barline(barStyle: BarStyle.lightHeavy),
        isFalse,
      );
      expect(
        base ==
            const Barline(
              repeat: Repeat(direction: RepeatDirection.forward),
            ),
        isFalse,
      );
      expect(
        base ==
            const Barline(
              ending: Ending(
                number: '1',
                type: StartStopDiscontinue.start,
              ),
            ),
        isFalse,
      );
    });

    test('equality uses list contents for fermatas', () {
      const a = Barline(fermatas: [Fermata()]);
      const b = Barline(fermatas: [Fermata()]);
      expect(a, b);
      expect(a == base, isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const Barline().hashCode);
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(location: BarlineLocation.right),
        const Barline(location: BarlineLocation.right),
      );
      expect(
        base.copyWith(barStyle: BarStyle.heavy),
        const Barline(barStyle: BarStyle.heavy),
      );
      const rep = Repeat(direction: RepeatDirection.backward);
      expect(
        base.copyWith(repeat: rep),
        const Barline(repeat: rep),
      );
      const end = Ending(number: '1', type: StartStopDiscontinue.start);
      expect(
        base.copyWith(ending: end),
        const Barline(ending: end),
      );
      expect(
        base.copyWith(fermatas: [const Fermata(shape: FermataShape.square)]),
        const Barline(fermatas: [Fermata(shape: FermataShape.square)]),
      );
    });
  });
}
