import 'package:musicxml_domain/musicxml_domain.dart';
import 'package:test/test.dart';

void main() {
  group('Pitch', () {
    const base = Pitch(step: Step.c, octave: 4);
    const withAlter = Pitch(step: Step.c, octave: 4, alter: 1);

    test('equality matches all fields', () {
      expect(base, const Pitch(step: Step.c, octave: 4));
      expect(base == withAlter, isFalse);
      expect(base == const Pitch(step: Step.d, octave: 4), isFalse);
      expect(base == const Pitch(step: Step.c, octave: 5), isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const Pitch(step: Step.c, octave: 4).hashCode);
      expect(base.hashCode == withAlter.hashCode, isFalse);
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(step: Step.d),
        const Pitch(step: Step.d, octave: 4),
      );
      expect(
        base.copyWith(octave: 5),
        const Pitch(step: Step.c, octave: 5),
      );
      expect(
        base.copyWith(alter: -1),
        const Pitch(step: Step.c, octave: 4, alter: -1),
      );
    });

    test('copyWith without args returns equal instance', () {
      expect(base.copyWith(), base);
    });
  });

  group('DisplayPitch', () {
    const base = DisplayPitch(displayStep: Step.e, displayOctave: 5);

    test('equality matches all fields', () {
      expect(base, const DisplayPitch(displayStep: Step.e, displayOctave: 5));
      expect(
        base ==
            const DisplayPitch(displayStep: Step.f, displayOctave: 5),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const DisplayPitch(
          displayStep: Step.e,
          displayOctave: 5,
        ).hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(displayStep: Step.g),
        const DisplayPitch(displayStep: Step.g, displayOctave: 5),
      );
      expect(
        base.copyWith(displayOctave: 4),
        const DisplayPitch(displayStep: Step.e, displayOctave: 4),
      );
    });
  });
}
