import 'package:musicxml_domain/musicxml_domain.dart';
import 'package:test/test.dart';

void main() {
  // ─── Simple notation classes ─────────────────────────────────────────────

  group('Tied', () {
    const base = Tied(type: TiedType.start);
    const withNumber = Tied(type: TiedType.start, number: 1);

    test('equality matches all fields', () {
      expect(base, const Tied(type: TiedType.start));
      expect(base == withNumber, isFalse);
      expect(base == const Tied(type: TiedType.stop), isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const Tied(type: TiedType.start).hashCode);
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(type: TiedType.stop),
        const Tied(type: TiedType.stop),
      );
      expect(
        base.copyWith(number: 2),
        const Tied(type: TiedType.start, number: 2),
      );
    });
  });

  group('Slur', () {
    const base = Slur(type: StartStopContinue.start);
    const full = Slur(
      type: StartStopContinue.start,
      number: 1,
      placement: Placement.above,
    );

    test('equality matches all fields', () {
      expect(base, const Slur(type: StartStopContinue.start));
      expect(base == full, isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const Slur(type: StartStopContinue.start).hashCode);
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(number: 1),
        const Slur(type: StartStopContinue.start, number: 1),
      );
      expect(
        base.copyWith(placement: Placement.below),
        const Slur(
          type: StartStopContinue.start,
          placement: Placement.below,
        ),
      );
    });
  });

  group('Tuplet', () {
    const base = Tuplet(type: StartStop.start);
    const full = Tuplet(
      type: StartStop.start,
      number: 1,
      bracket: true,
      showNumber: ShowTuplet.actual,
      showType: ShowTuplet.none,
    );

    test('equality matches all fields', () {
      expect(base, const Tuplet(type: StartStop.start));
      expect(base == full, isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const Tuplet(type: StartStop.start).hashCode);
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(bracket: true),
        const Tuplet(type: StartStop.start, bracket: true),
      );
      expect(
        base.copyWith(showNumber: ShowTuplet.both),
        const Tuplet(type: StartStop.start, showNumber: ShowTuplet.both),
      );
    });
  });

  group('Glissando', () {
    const base = Glissando(type: StartStop.start);
    const full = Glissando(
      type: StartStop.start,
      number: 1,
      lineType: LineType.solid,
      text: 'gliss.',
    );

    test('equality matches all fields', () {
      expect(base, const Glissando(type: StartStop.start));
      expect(base == full, isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const Glissando(type: StartStop.start).hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(text: 'gliss.'),
        const Glissando(type: StartStop.start, text: 'gliss.'),
      );
      expect(
        base.copyWith(lineType: LineType.dashed),
        const Glissando(type: StartStop.start, lineType: LineType.dashed),
      );
    });
  });

  group('Slide', () {
    const base = Slide(type: StartStop.start);

    test('equality matches all fields', () {
      expect(base, const Slide(type: StartStop.start));
      expect(base == const Slide(type: StartStop.stop), isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const Slide(type: StartStop.start).hashCode);
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(lineType: LineType.wavy),
        const Slide(type: StartStop.start, lineType: LineType.wavy),
      );
    });
  });

  // ─── Ornament sealed class ───────────────────────────────────────────────

  group('TrillMark', () {
    test('const instances are equal', () {
      expect(const TrillMark(), const TrillMark());
    });

    test('hashCode is stable', () {
      expect(const TrillMark().hashCode, const TrillMark().hashCode);
    });

    test('is not equal to Turn', () {
      expect(const TrillMark() == const Turn(), isFalse);
    });
  });

  group('WavyLine', () {
    const base = WavyLine(type: StartStopContinue.start);

    test('equality matches type', () {
      expect(base, const WavyLine(type: StartStopContinue.start));
      expect(
        base == const WavyLine(type: StartStopContinue.stop),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const WavyLine(type: StartStopContinue.start).hashCode,
      );
    });

    test('copyWith replaces type', () {
      expect(
        base.copyWith(type: StartStopContinue.stop),
        const WavyLine(type: StartStopContinue.stop),
      );
    });
  });

  group('Mordent', () {
    const base = Mordent();

    test('defaults long to false', () {
      expect(base.long, isFalse);
    });

    test('equality matches long field', () {
      expect(base, const Mordent());
      expect(base == const Mordent(long: true), isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const Mordent().hashCode);
    });

    test('copyWith replaces long', () {
      expect(base.copyWith(long: true), const Mordent(long: true));
    });

    test('is not equal to InvertedMordent', () {
      expect(const Mordent() == const InvertedMordent(), isFalse);
    });
  });

  group('Tremolo', () {
    const base = Tremolo(type: TremoloType.single, marks: 2);

    test('equality matches all fields', () {
      expect(base, const Tremolo(type: TremoloType.single, marks: 2));
      expect(base == const Tremolo(type: TremoloType.start, marks: 2), isFalse);
      expect(
        base == const Tremolo(type: TremoloType.single, marks: 3),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const Tremolo(type: TremoloType.single, marks: 2).hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(marks: 3),
        const Tremolo(type: TremoloType.single, marks: 3),
      );
    });
  });

  group('AccidentalMark', () {
    const base = AccidentalMark(type: AccidentalType.sharp);

    test('equality matches all fields', () {
      expect(base, const AccidentalMark(type: AccidentalType.sharp));
      expect(
        base == const AccidentalMark(type: AccidentalType.flat),
        isFalse,
      );
    });

    test('copyWith replaces placement', () {
      expect(
        base.copyWith(placement: Placement.above),
        const AccidentalMark(
          type: AccidentalType.sharp,
          placement: Placement.above,
        ),
      );
    });
  });

  group('Ornament sealed pattern match', () {
    test('all subtypes are exhaustively covered', () {
      final ornaments = <Ornament>[
        const TrillMark(),
        const Turn(),
        const DelayedTurn(),
        const InvertedTurn(),
        const DelayedInvertedTurn(),
        const VerticalTurn(),
        const InvertedVerticalTurn(),
        const Shake(),
        const Schleifer(),
        const Haydn(),
        const WavyLine(type: StartStopContinue.start),
        const Mordent(),
        const InvertedMordent(),
        const Tremolo(type: TremoloType.single, marks: 1),
        const OtherOrnament(value: 'x'),
        const AccidentalMark(type: AccidentalType.natural),
      ];

      for (final o in ornaments) {
        final label = switch (o) {
          TrillMark() => 'trillMark',
          Turn() => 'turn',
          DelayedTurn() => 'delayedTurn',
          InvertedTurn() => 'invertedTurn',
          DelayedInvertedTurn() => 'delayedInvertedTurn',
          VerticalTurn() => 'verticalTurn',
          InvertedVerticalTurn() => 'invertedVerticalTurn',
          Shake() => 'shake',
          Schleifer() => 'schleifer',
          Haydn() => 'haydn',
          WavyLine() => 'wavyLine',
          Mordent() => 'mordent',
          InvertedMordent() => 'invertedMordent',
          Tremolo() => 'tremolo',
          OtherOrnament() => 'otherOrnament',
          AccidentalMark() => 'accidentalMark',
        };
        expect(label, isNotEmpty);
      }
    });
  });

  // ─── Technical sealed class ──────────────────────────────────────────────

  group('UpBow', () {
    test('const instances are equal', () {
      expect(const UpBow(), const UpBow());
    });

    test('is not equal to DownBow', () {
      expect(const UpBow() == const DownBow(), isFalse);
    });
  });

  group('Fingering', () {
    const base = Fingering(value: 1);

    test('equality matches value', () {
      expect(base, const Fingering(value: 1));
      expect(base == const Fingering(value: 2), isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const Fingering(value: 1).hashCode);
    });

    test('copyWith replaces value', () {
      expect(base.copyWith(value: 3), const Fingering(value: 3));
    });
  });

  group('HammerOn', () {
    const base = HammerOn(type: StartStop.start);

    test('equality matches all fields', () {
      expect(base, const HammerOn(type: StartStop.start));
      expect(
        base ==
            const HammerOn(type: StartStop.start, number: 1, text: 'H'),
        isFalse,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(text: 'H'),
        const HammerOn(type: StartStop.start, text: 'H'),
      );
    });
  });

  group('Harmonic', () {
    const base = Harmonic();

    test('defaults natural and artificial to false', () {
      expect(base.natural, isFalse);
      expect(base.artificial, isFalse);
    });

    test('equality matches all fields', () {
      expect(base, const Harmonic());
      expect(base == const Harmonic(natural: true), isFalse);
    });

    test('copyWith replaces fields', () {
      expect(
        base.copyWith(natural: true),
        const Harmonic(natural: true),
      );
    });
  });

  group('Bend', () {
    const base = Bend(alter: 1);

    test('defaults withBar and preBend to false', () {
      expect(base.withBar, isFalse);
      expect(base.preBend, isFalse);
    });

    test('equality matches all fields', () {
      expect(base, const Bend(alter: 1));
      expect(base == const Bend(alter: 0.5), isFalse);
      expect(base == const Bend(alter: 1, withBar: true), isFalse);
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(preBend: true),
        const Bend(alter: 1, preBend: true),
      );
      expect(
        base.copyWith(release: true),
        const Bend(alter: 1, release: true),
      );
    });
  });

  group('Technical sealed pattern match', () {
    test('all subtypes are exhaustively covered', () {
      final technicals = <Technical>[
        const UpBow(),
        const DownBow(),
        const OpenString(),
        const ThumbPosition(),
        const DoubleTongue(),
        const TripleTongue(),
        const Stopped(),
        const SnapPizzicato(),
        const Fingernails(),
        const BrassBend(),
        const Flip(),
        const Smear(),
        const Open(),
        const HalfMuted(),
        const Golpe(),
        const Fingering(value: 1),
        const Pluck(value: 'p'),
        const Fret(value: 3),
        const StringNumber(value: 2),
        const HammerOn(type: StartStop.start),
        const PullOff(type: StartStop.stop),
        const Tap(),
        const Heel(),
        const Toe(),
        const Hole(),
        const Arrow(),
        const Handbell(value: 'damp'),
        const HarmonMute(),
        const Harmonic(),
        const Bend(alter: 1),
        const OtherTechnical(),
      ];

      for (final t in technicals) {
        final label = switch (t) {
          UpBow() => 'upBow',
          DownBow() => 'downBow',
          OpenString() => 'openString',
          ThumbPosition() => 'thumbPosition',
          DoubleTongue() => 'doubleTongue',
          TripleTongue() => 'tripleTongue',
          Stopped() => 'stopped',
          SnapPizzicato() => 'snapPizzicato',
          Fingernails() => 'fingernails',
          BrassBend() => 'brassBend',
          Flip() => 'flip',
          Smear() => 'smear',
          Open() => 'open',
          HalfMuted() => 'halfMuted',
          Golpe() => 'golpe',
          Fingering() => 'fingering',
          Pluck() => 'pluck',
          Fret() => 'fret',
          StringNumber() => 'stringNumber',
          HammerOn() => 'hammerOn',
          PullOff() => 'pullOff',
          Tap() => 'tap',
          Heel() => 'heel',
          Toe() => 'toe',
          Hole() => 'hole',
          Arrow() => 'arrow',
          Handbell() => 'handbell',
          HarmonMute() => 'harmonMute',
          Harmonic() => 'harmonic',
          Bend() => 'bend',
          OtherTechnical() => 'otherTechnical',
        };
        expect(label, isNotEmpty);
      }
    });
  });

  // ─── Articulation sealed class ───────────────────────────────────────────

  group('Accent', () {
    test('const instances are equal', () {
      expect(const Accent(), const Accent());
    });

    test('is not equal to Staccato', () {
      expect(const Accent() == const Staccato(), isFalse);
    });
  });

  group('StrongAccent', () {
    const base = StrongAccent();

    test('equality matches type field', () {
      expect(base, const StrongAccent());
      expect(base == const StrongAccent(type: 'up'), isFalse);
    });

    test('copyWith replaces type', () {
      expect(base.copyWith(type: 'down'), const StrongAccent(type: 'down'));
    });
  });

  group('BreathMark', () {
    const base = BreathMark();

    test('equality matches type field', () {
      expect(base, const BreathMark());
      expect(base == const BreathMark(type: 'comma'), isFalse);
    });

    test('copyWith replaces type', () {
      expect(
        base.copyWith(type: 'comma'),
        const BreathMark(type: 'comma'),
      );
    });
  });

  group('Articulation sealed pattern match', () {
    test('all subtypes are exhaustively covered', () {
      final arts = <Articulation>[
        const Accent(),
        const Staccato(),
        const Tenuto(),
        const DetachedLegato(),
        const Staccatissimo(),
        const Spiccato(),
        const Scoop(),
        const Plop(),
        const Doit(),
        const Falloff(),
        const Stress(),
        const Unstress(),
        const SoftAccent(),
        const StrongAccent(type: 'up'),
        const BreathMark(type: 'comma'),
        const Caesura(type: 'normal'),
        const OtherArticulation(value: 'x'),
      ];

      for (final a in arts) {
        final label = switch (a) {
          Accent() => 'accent',
          Staccato() => 'staccato',
          Tenuto() => 'tenuto',
          DetachedLegato() => 'detachedLegato',
          Staccatissimo() => 'staccatissimo',
          Spiccato() => 'spiccato',
          Scoop() => 'scoop',
          Plop() => 'plop',
          Doit() => 'doit',
          Falloff() => 'falloff',
          Stress() => 'stress',
          Unstress() => 'unstress',
          SoftAccent() => 'softAccent',
          StrongAccent() => 'strongAccent',
          BreathMark() => 'breathMark',
          Caesura() => 'caesura',
          OtherArticulation() => 'otherArticulation',
        };
        expect(label, isNotEmpty);
      }
    });
  });

  // ─── Container classes ───────────────────────────────────────────────────

  group('Dynamics', () {
    const base = Dynamics(types: [DynamicsType.f]);
    const empty = Dynamics();

    test('defaults to empty list', () {
      expect(empty.types, isEmpty);
    });

    test('equality uses list contents not reference identity', () {
      expect(base, const Dynamics(types: [DynamicsType.f]));
      expect(base == const Dynamics(types: [DynamicsType.p]), isFalse);
      expect(base == empty, isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const Dynamics(types: [DynamicsType.f]).hashCode,
      );
    });

    test('copyWith replaces list', () {
      expect(
        base.copyWith(types: [DynamicsType.p, DynamicsType.p]),
        const Dynamics(types: [DynamicsType.p, DynamicsType.p]),
      );
    });
  });

  group('Fermata', () {
    const base = Fermata();

    test('defaults inverted to false', () {
      expect(base.inverted, isFalse);
    });

    test('equality matches all fields', () {
      expect(base, const Fermata());
      expect(base == const Fermata(inverted: true), isFalse);
      expect(
        base == const Fermata(shape: FermataShape.square),
        isFalse,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(shape: FermataShape.angled),
        const Fermata(shape: FermataShape.angled),
      );
      expect(
        base.copyWith(inverted: true),
        const Fermata(inverted: true),
      );
    });
  });

  group('Arpeggiate', () {
    const base = Arpeggiate();

    test('equality matches all fields', () {
      expect(base, const Arpeggiate());
      expect(
        base == const Arpeggiate(direction: ArpeggiateDirection.up),
        isFalse,
      );
    });

    test('copyWith replaces direction', () {
      expect(
        base.copyWith(direction: ArpeggiateDirection.down),
        const Arpeggiate(direction: ArpeggiateDirection.down),
      );
    });
  });

  group('NonArpeggiate', () {
    const base = NonArpeggiate(type: NonArpeggiateType.top);

    test('equality matches type', () {
      expect(base, const NonArpeggiate(type: NonArpeggiateType.top));
      expect(
        base == const NonArpeggiate(type: NonArpeggiateType.bottom),
        isFalse,
      );
    });

    test('copyWith replaces type', () {
      expect(
        base.copyWith(type: NonArpeggiateType.bottom),
        const NonArpeggiate(type: NonArpeggiateType.bottom),
      );
    });
  });

  // ─── Notations container ───────────────────────────────────────────────────

  group('Notations', () {
    const empty = Notations();

    test('defaults all lists to empty', () {
      expect(empty.tied, isEmpty);
      expect(empty.slurs, isEmpty);
      expect(empty.tuplets, isEmpty);
      expect(empty.glissandi, isEmpty);
      expect(empty.slides, isEmpty);
      expect(empty.ornaments, isEmpty);
      expect(empty.technicals, isEmpty);
      expect(empty.articulations, isEmpty);
      expect(empty.dynamics, isEmpty);
      expect(empty.fermatas, isEmpty);
      expect(empty.arpeggiates, isEmpty);
      expect(empty.nonArpeggiates, isEmpty);
    });

    test('equality checks all lists', () {
      expect(empty, const Notations());
      expect(
        empty ==
            const Notations(tied: [Tied(type: TiedType.start)]),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(empty.hashCode, const Notations().hashCode);
    });

    test('copyWith replaces individual lists', () {
      const slur = Slur(type: StartStopContinue.start);
      expect(
        empty.copyWith(slurs: [slur]),
        const Notations(slurs: [slur]),
      );

      const fermata = Fermata(shape: FermataShape.normal);
      expect(
        empty.copyWith(fermatas: [fermata]),
        const Notations(fermatas: [fermata]),
      );
    });

    test('equality uses list contents not reference identity', () {
      const a = Notations(
        tied: [Tied(type: TiedType.start)],
      );
      const b = Notations(
        tied: [Tied(type: TiedType.start)],
      );
      expect(a, b);
    });
  });
}
