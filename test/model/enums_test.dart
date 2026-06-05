import 'package:musicxml_domain/musicxml_domain.dart';
import 'package:test/test.dart';

void main() {
  group('Step', () {
    test('value maps to MusicXML string', () {
      expect(Step.a.value, 'A');
      expect(Step.b.value, 'B');
      expect(Step.g.value, 'G');
    });

    test('equality is identity-based', () {
      expect(Step.a, Step.a);
      expect(Step.a == Step.b, isFalse);
    });
  });

  group('NoteType', () {
    test('value maps to MusicXML string', () {
      expect(NoteType.n1024th.value, '1024th');
      expect(NoteType.quarter.value, 'quarter');
      expect(NoteType.maxima.value, 'maxima');
    });
  });

  group('Syllabic', () {
    test('value maps to MusicXML string', () {
      expect(Syllabic.single.value, 'single');
      expect(Syllabic.begin.value, 'begin');
      expect(Syllabic.end.value, 'end');
      expect(Syllabic.middle.value, 'middle');
    });
  });

  group('BarStyle', () {
    test('value maps to MusicXML string', () {
      expect(BarStyle.lightHeavy.value, 'light-heavy');
      expect(BarStyle.heavyLight.value, 'heavy-light');
    });
  });

  group('StartStopContinue', () {
    test('continueValue maps to continue string', () {
      expect(StartStopContinue.continueValue.value, 'continue');
    });
  });

  group('BeamType', () {
    test('continueBeam and hooks map correctly', () {
      expect(BeamType.continueBeam.value, 'continue');
      expect(BeamType.forwardHook.value, 'forward hook');
      expect(BeamType.backwardHook.value, 'backward hook');
    });
  });

  group('StemDirection', () {
    test('doubleBeam maps to double', () {
      expect(StemDirection.doubleBeam.value, 'double');
    });
  });

  group('NoteheadType', () {
    test('doh maps to do', () {
      expect(NoteheadType.doh.value, 'do');
    });
  });
}
