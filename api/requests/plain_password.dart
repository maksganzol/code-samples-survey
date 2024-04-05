import 'package:freezed_annotation/freezed_annotation.dart';

part 'plain_password.g.dart';

@JsonSerializable(createFactory: false)
class PlainPassword {
  const PlainPassword({
    required this.first,
    required this.second,
  });

  final String first;
  final String second;

  Map<String, dynamic> toJson() => _$PlainPasswordToJson(this);
}
