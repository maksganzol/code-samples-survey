// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_error_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationErrorData _$VerificationErrorDataFromJson(
        Map<String, dynamic> json) =>
    VerificationErrorData(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      children: (json['children'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, VerificationErrorData.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$VerificationErrorDataToJson(
        VerificationErrorData instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'children': instance.children,
    };
