import 'package:json_annotation/json_annotation.dart';

part 'confirm_email_request.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class ConfirmEmailRequest {
  const ConfirmEmailRequest({
    required this.tokenConfirmation,
  });

  final String tokenConfirmation;

  Map<String, dynamic> toJson() => _$ConfirmEmailRequestToJson(this);
}
