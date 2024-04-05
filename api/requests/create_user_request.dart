import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panodyssey_core/api/requests/plain_password.dart';

part 'create_user_request.g.dart';

@JsonSerializable(createFactory: false)
class CreateUserRequest {
  const CreateUserRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.plainPassword,
    required this.termsAgreed,
  });

  @JsonKey(name: 'firstname')
  final String firstName;
  @JsonKey(name: 'lastname')
  final String lastName;
  final String email;
  final PlainPassword plainPassword;
  final bool termsAgreed;

  Map<String, dynamic> toJson() => {
        ..._$CreateUserRequestToJson(this),
        'plainPassword': plainPassword.toJson(),
      };
}
