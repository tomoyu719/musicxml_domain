import 'package:collection/collection.dart';
import 'package:musicxml_domain/src/model/arpeggiate.dart';
import 'package:musicxml_domain/src/model/articulation.dart';
import 'package:musicxml_domain/src/model/dynamics.dart';
import 'package:musicxml_domain/src/model/fermata.dart';
import 'package:musicxml_domain/src/model/glissando.dart';
import 'package:musicxml_domain/src/model/non_arpeggiate.dart';
import 'package:musicxml_domain/src/model/ornament.dart';
import 'package:musicxml_domain/src/model/slide.dart';
import 'package:musicxml_domain/src/model/slur.dart';
import 'package:musicxml_domain/src/model/technical.dart';
import 'package:musicxml_domain/src/model/tied.dart';
import 'package:musicxml_domain/src/model/tuplet.dart';

final class Notations {
  const Notations({
    this.tied = const [],
    this.slurs = const [],
    this.tuplets = const [],
    this.glissandi = const [],
    this.slides = const [],
    this.ornaments = const [],
    this.technicals = const [],
    this.articulations = const [],
    this.dynamics = const [],
    this.fermatas = const [],
    this.arpeggiates = const [],
    this.nonArpeggiates = const [],
  });

  final List<Tied> tied;
  final List<Slur> slurs;
  final List<Tuplet> tuplets;
  final List<Glissando> glissandi;
  final List<Slide> slides;
  final List<Ornament> ornaments;
  final List<Technical> technicals;
  final List<Articulation> articulations;
  final List<Dynamics> dynamics;
  final List<Fermata> fermatas;
  final List<Arpeggiate> arpeggiates;
  final List<NonArpeggiate> nonArpeggiates;

  Notations copyWith({
    List<Tied>? tied,
    List<Slur>? slurs,
    List<Tuplet>? tuplets,
    List<Glissando>? glissandi,
    List<Slide>? slides,
    List<Ornament>? ornaments,
    List<Technical>? technicals,
    List<Articulation>? articulations,
    List<Dynamics>? dynamics,
    List<Fermata>? fermatas,
    List<Arpeggiate>? arpeggiates,
    List<NonArpeggiate>? nonArpeggiates,
  }) =>
      Notations(
        tied: tied ?? this.tied,
        slurs: slurs ?? this.slurs,
        tuplets: tuplets ?? this.tuplets,
        glissandi: glissandi ?? this.glissandi,
        slides: slides ?? this.slides,
        ornaments: ornaments ?? this.ornaments,
        technicals: technicals ?? this.technicals,
        articulations: articulations ?? this.articulations,
        dynamics: dynamics ?? this.dynamics,
        fermatas: fermatas ?? this.fermatas,
        arpeggiates: arpeggiates ?? this.arpeggiates,
        nonArpeggiates: nonArpeggiates ?? this.nonArpeggiates,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Notations &&
          runtimeType == other.runtimeType &&
          const ListEquality<Tied>().equals(tied, other.tied) &&
          const ListEquality<Slur>().equals(slurs, other.slurs) &&
          const ListEquality<Tuplet>().equals(tuplets, other.tuplets) &&
          const ListEquality<Glissando>().equals(glissandi, other.glissandi) &&
          const ListEquality<Slide>().equals(slides, other.slides) &&
          const ListEquality<Ornament>().equals(ornaments, other.ornaments) &&
          const ListEquality<Technical>()
              .equals(technicals, other.technicals) &&
          const ListEquality<Articulation>()
              .equals(articulations, other.articulations) &&
          const ListEquality<Dynamics>().equals(dynamics, other.dynamics) &&
          const ListEquality<Fermata>().equals(fermatas, other.fermatas) &&
          const ListEquality<Arpeggiate>()
              .equals(arpeggiates, other.arpeggiates) &&
          const ListEquality<NonArpeggiate>()
              .equals(nonArpeggiates, other.nonArpeggiates);

  @override
  int get hashCode => Object.hashAll([
        const ListEquality<Tied>().hash(tied),
        const ListEquality<Slur>().hash(slurs),
        const ListEquality<Tuplet>().hash(tuplets),
        const ListEquality<Glissando>().hash(glissandi),
        const ListEquality<Slide>().hash(slides),
        const ListEquality<Ornament>().hash(ornaments),
        const ListEquality<Technical>().hash(technicals),
        const ListEquality<Articulation>().hash(articulations),
        const ListEquality<Dynamics>().hash(dynamics),
        const ListEquality<Fermata>().hash(fermatas),
        const ListEquality<Arpeggiate>().hash(arpeggiates),
        const ListEquality<NonArpeggiate>().hash(nonArpeggiates),
      ]);
}
