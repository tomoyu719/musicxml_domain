final class GraceInfo {
  const GraceInfo({this.slash = false});

  /// Whether the grace note has a slash (acciaccatura).
  final bool slash;

  GraceInfo copyWith({bool? slash}) => GraceInfo(slash: slash ?? this.slash);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GraceInfo &&
          runtimeType == other.runtimeType &&
          slash == other.slash;

  @override
  int get hashCode => slash.hashCode;
}
