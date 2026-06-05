import 'package:musicxml_domain/musicxml_domain.dart';
import 'package:test/test.dart';

void main() {
  group('SyllableContent', () {
    const base = SyllableContent(text: 'la', syllabic: Syllabic.single);
    const withExtend = SyllableContent(
      text: 'la',
      syllabic: Syllabic.single,
      extend: StartStopContinue.start,
    );

    test('equality matches all fields', () {
      expect(
        base,
        const SyllableContent(text: 'la', syllabic: Syllabic.single),
      );
      expect(base == withExtend, isFalse);
      expect(
        base ==
            const SyllableContent(text: 'lo', syllabic: Syllabic.single),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const SyllableContent(
          text: 'la',
          syllabic: Syllabic.single,
        ).hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(text: 'lo'),
        const SyllableContent(text: 'lo', syllabic: Syllabic.single),
      );
      expect(
        base.copyWith(syllabic: Syllabic.begin),
        const SyllableContent(text: 'la', syllabic: Syllabic.begin),
      );
      expect(
        base.copyWith(extend: StartStopContinue.stop),
        const SyllableContent(
          text: 'la',
          syllabic: Syllabic.single,
          extend: StartStopContinue.stop,
        ),
      );
    });
  });

  group('ExtendContent', () {
    const base = ExtendContent(type: StartStopContinue.start);
    const noType = ExtendContent();

    test('equality matches type field', () {
      expect(base, const ExtendContent(type: StartStopContinue.start));
      expect(base == noType, isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const ExtendContent(type: StartStopContinue.start).hashCode,
      );
    });

    test('copyWith replaces type', () {
      expect(
        base.copyWith(type: StartStopContinue.stop),
        const ExtendContent(type: StartStopContinue.stop),
      );
    });
  });

  group('LaughingContent', () {
    test('const instances are equal', () {
      expect(const LaughingContent(), const LaughingContent());
    });

    test('hashCode is stable', () {
      expect(
        const LaughingContent().hashCode,
        const LaughingContent().hashCode,
      );
    });
  });

  group('HummingContent', () {
    test('const instances are equal', () {
      expect(const HummingContent(), const HummingContent());
    });

    test('is not equal to LaughingContent', () {
      expect(const HummingContent() == const LaughingContent(), isFalse);
    });
  });

  group('Lyric', () {
    const syllable = SyllableContent(
      text: 'sol',
      syllabic: Syllabic.single,
    );
    const base = Lyric(content: syllable, number: '1');
    const withName = Lyric(
      content: syllable,
      number: '1',
      name: 'verse',
    );

    test('equality matches all fields', () {
      expect(base, const Lyric(content: syllable, number: '1'));
      expect(base == withName, isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const Lyric(content: syllable, number: '1').hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(number: '2'),
        const Lyric(content: syllable, number: '2'),
      );
      expect(
        base.copyWith(endLine: true),
        const Lyric(content: syllable, number: '1', endLine: true),
      );
      expect(
        base.copyWith(endParagraph: true),
        const Lyric(
          content: syllable,
          number: '1',
          endParagraph: true,
        ),
      );
    });

    test('defaults endLine and endParagraph to false', () {
      expect(base.endLine, isFalse);
      expect(base.endParagraph, isFalse);
    });
  });

  group('LyricContent sealed pattern match', () {
    test('all subtypes are exhaustively covered', () {
      final contents = <LyricContent>[
        const SyllableContent(text: 'x'),
        const ExtendContent(),
        const LaughingContent(),
        const HummingContent(),
      ];

      for (final content in contents) {
        final label = switch (content) {
          SyllableContent() => 'syllable',
          ExtendContent() => 'extend',
          LaughingContent() => 'laughing',
          HummingContent() => 'humming',
        };
        expect(label, isNotEmpty);
      }
    });
  });
}
