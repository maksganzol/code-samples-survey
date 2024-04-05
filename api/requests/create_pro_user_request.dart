import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panodyssey_core/api/requests/address_request.dart';
import 'package:panodyssey_core/api/requests/plain_password.dart';
import 'package:panodyssey_core/enum/organization_status.dart';

part 'create_pro_user_request.g.dart';

@JsonSerializable(createFactory: false)
class CreateProUserRequest {
  const CreateProUserRequest({
    required this.email,
    required this.plainPassword,
    required this.pseudo,
    required this.company,
  });

  final String email;
  final PlainPassword plainPassword;
  final String pseudo;
  final CompanyRequest company;

  Map<String, dynamic> toJson() => {
        ..._$CreateProUserRequestToJson(this),
        'plainPassword': plainPassword.toJson(),
        'company': company.toJson(),
      };
}

@JsonSerializable(createFactory: false)
class CompanyRequest {
  const CompanyRequest({
    required this.name,
    required this.businessType,
    required this.number,
    required this.vatNumber,
    required this.address,
  });
  final String name;
  final OrganizationStatus businessType;
  final String number;
  final String vatNumber;
  final AddressRequest address;

  Map<String, dynamic> toJson() => {
        ..._$CompanyRequestToJson(this),
        'address': address.toJson(),
      };
}
