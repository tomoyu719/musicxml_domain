import 'package:musicxml_domain/src/model/enums.dart';

final class NonArpeggiate {
  const NonArpeggiate({required this.type});

  final NonArpeggiateType type;

  NonArpeggiate copyWith({NonArpeggiateType? type}) =>
      NonArpeggiate(type: type ?? this.type);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NonArpeggiate &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;
}
