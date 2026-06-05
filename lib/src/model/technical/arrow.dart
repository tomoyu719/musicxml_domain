part of '../technical.dart';

final class Arrow extends Technical {
  const Arrow({this.direction, this.style, this.circularArrow});

  final String? direction;
  final String? style;
  final String? circularArrow;

  Arrow copyWith({
    String? direction,
    String? style,
    String? circularArrow,
  }) =>
      Arrow(
        direction: direction ?? this.direction,
        style: style ?? this.style,
        circularArrow: circularArrow ?? this.circularArrow,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Arrow &&
          runtimeType == other.runtimeType &&
          direction == other.direction &&
          style == other.style &&
          circularArrow == other.circularArrow;

  @override
  int get hashCode => Object.hash(direction, style, circularArrow);
}
