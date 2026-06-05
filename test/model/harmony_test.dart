import 'package:musicxml_domain/musicxml_domain.dart';
import 'package:test/test.dart';

void main() {
  // ─── HarmonyRoot ──────────────────────────────────────────────────────────

  group('HarmonyRoot', () {
    const base = HarmonyRoot(step: Step.c);

    test('alter defaults to null', () {
      expect(base.alter, isNull);
    });

    test('equality matches all fields', () {
      expect(base, const HarmonyRoot(step: Step.c));
      expect(base == const HarmonyRoot(step: Step.g), isFalse);
      expect(
        base == const HarmonyRoot(step: Step.c, alter: 1),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const HarmonyRoot(step: Step.c).hashCode);
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(step: Step.f),
        const HarmonyRoot(step: Step.f),
      );
      expect(
        base.copyWith(alter: -1),
        const HarmonyRoot(step: Step.c, alter: -1),
      );
    });
  });

  // ─── HarmonyKind ──────────────────────────────────────────────────────────

  group('HarmonyKind', () {
    const base = HarmonyKind(value: HarmonyKindValue.major);

    test('defaults text to null, useSymbols and stackDegrees to false', () {
      expect(base.text, isNull);
      expect(base.useSymbols, isFalse);
      expect(base.stackDegrees, isFalse);
    });

    test('equality matches all fields', () {
      expect(base, const HarmonyKind(value: HarmonyKindValue.major));
      expect(
        base == const HarmonyKind(value: HarmonyKindValue.minor),
        isFalse,
      );
      expect(
        base == const HarmonyKind(value: HarmonyKindValue.major, text: 'M'),
        isFalse,
      );
      expect(
        base ==
            const HarmonyKind(
              value: HarmonyKindValue.major,
              useSymbols: true,
            ),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const HarmonyKind(value: HarmonyKindValue.major).hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(text: 'maj'),
        const HarmonyKind(value: HarmonyKindValue.major, text: 'maj'),
      );
      expect(
        base.copyWith(useSymbols: true),
        const HarmonyKind(
          value: HarmonyKindValue.major,
          useSymbols: true,
        ),
      );
      expect(
        base.copyWith(stackDegrees: true),
        const HarmonyKind(
          value: HarmonyKindValue.major,
          stackDegrees: true,
        ),
      );
    });
  });

  // ─── HarmonyDegree ────────────────────────────────────────────────────────

  group('HarmonyDegree', () {
    const base = HarmonyDegree(
      degreeValue: 7,
      degreeAlter: 0,
      degreeType: DegreeType.add,
    );

    test('equality matches all fields', () {
      expect(
        base,
        const HarmonyDegree(
          degreeValue: 7,
          degreeAlter: 0,
          degreeType: DegreeType.add,
        ),
      );
      expect(
        base ==
            const HarmonyDegree(
              degreeValue: 9,
              degreeAlter: 0,
              degreeType: DegreeType.add,
            ),
        isFalse,
      );
      expect(
        base ==
            const HarmonyDegree(
              degreeValue: 7,
              degreeAlter: -1,
              degreeType: DegreeType.add,
            ),
        isFalse,
      );
      expect(
        base ==
            const HarmonyDegree(
              degreeValue: 7,
              degreeAlter: 0,
              degreeType: DegreeType.alter,
            ),
        isFalse,
      );
    });

    test('hashCode is consistent with equality', () {
      expect(
        base.hashCode,
        const HarmonyDegree(
          degreeValue: 7,
          degreeAlter: 0,
          degreeType: DegreeType.add,
        ).hashCode,
      );
    });

    test('copyWith replaces individual fields', () {
      expect(
        base.copyWith(degreeValue: 9),
        const HarmonyDegree(
          degreeValue: 9,
          degreeAlter: 0,
          degreeType: DegreeType.add,
        ),
      );
      expect(
        base.copyWith(degreeAlter: -1),
        const HarmonyDegree(
          degreeValue: 7,
          degreeAlter: -1,
          degreeType: DegreeType.add,
        ),
      );
      expect(
        base.copyWith(degreeType: DegreeType.subtract),
        const HarmonyDegree(
          degreeValue: 7,
          degreeAlter: 0,
          degreeType: DegreeType.subtract,
        ),
      );
    });
  });

  // ─── Harmony ──────────────────────────────────────────────────────────────

  group('Harmony', () {
    const root = HarmonyRoot(step: Step.c);
    const kind = HarmonyKind(value: HarmonyKindValue.major);
    const base = Harmony(root: root, kind: kind);

    test('defaults optional fields to null and degrees to empty list', () {
      expect(base.bass, isNull);
      expect(base.inversion, isNull);
      expect(base.offset, isNull);
      expect(base.staff, isNull);
      expect(base.type, isNull);
      expect(base.degrees, isEmpty);
    });

    test('equality matches all fields', () {
      expect(base, const Harmony(root: root, kind: kind));
      expect(
        base ==
            const Harmony(
              root: HarmonyRoot(step: Step.g),
              kind: kind,
            ),
        isFalse,
      );
      expect(
        base ==
            const Harmony(
              root: root,
              kind: HarmonyKind(value: HarmonyKindValue.minor),
            ),
        isFalse,
      );
    });

    test('equality uses list contents for degrees', () {
      const deg = HarmonyDegree(
        degreeValue: 7,
        degreeAlter: 0,
        degreeType: DegreeType.add,
      );
      const a = Harmony(root: root, kind: kind, degrees: [deg]);
      const b = Harmony(root: root, kind: kind, degrees: [deg]);
      expect(a, b);
      expect(a == base, isFalse);
    });

    test('hashCode is consistent with equality', () {
      expect(base.hashCode, const Harmony(root: root, kind: kind).hashCode);
    });

    test('copyWith replaces individual fields', () {
      const bass = HarmonyRoot(step: Step.e);
      expect(
        base.copyWith(bass: bass),
        const Harmony(root: root, kind: kind, bass: bass),
      );
      expect(
        base.copyWith(inversion: 1),
        const Harmony(root: root, kind: kind, inversion: 1),
      );
      expect(
        base.copyWith(type: HarmonyType.explicit),
        const Harmony(root: root, kind: kind, type: HarmonyType.explicit),
      );
      expect(
        base.copyWith(staff: 1),
        const Harmony(root: root, kind: kind, staff: 1),
      );
      expect(
        base.copyWith(offset: 4),
        const Harmony(root: root, kind: kind, offset: 4),
      );
    });
  });
}
