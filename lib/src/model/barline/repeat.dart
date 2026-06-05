part of '../barline.dart';

final class Repeat {
  const Repeat({required this.direction, this.times, this.winged});

  final RepeatDirection direction;
  final int? times;
  final WingedType? winged;

  Repeat copyWith({
    RepeatDirection? direction,
    int? times,
    WingedType? winged,
  }) =>
      Repeat(
        direction: direction ?? this.direction,
        times: times ?? this.times,
        winged: winged ?? this.winged,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Repeat &&
          runtimeType == other.runtimeType &&
          direction == other.direction &&
          times == other.times &&
          winged == other.winged;

  @override
  int get hashCode => Object.hash(direction, times, winged);
}
