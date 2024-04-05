// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_pro_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateProUserRequestToJson(
        CreateProUserRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'plainPassword': instance.plainPassword,
      'pseudo': instance.pseudo,
      'company': instance.company,
    };

Map<String, dynamic> _$CompanyRequestToJson(CompanyRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'businessType': _$OrganizationStatusEnumMap[instance.businessType]!,
      'number': instance.number,
      'vatNumber': instance.vatNumber,
      'address': instance.address,
    };

const _$OrganizationStatusEnumMap = {
  OrganizationStatus.company: 'Business',
  OrganizationStatus.organization: 'Organization',
  OrganizationStatus.freelancer: 'Soletrader',
};
