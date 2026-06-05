part of '../technical.dart';

final class Open extends Technical {
  const Open() : super();

  @override
  bool operator ==(Object other) => identical(this, other) || other is Open;

  @override
  int get hashCode => runtimeType.hashCode;
}
