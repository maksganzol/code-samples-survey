import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_error_data.freezed.dart';
part 'verification_error_data.g.dart';

@freezed
@JsonSerializable()
class VerificationErrorData with _$VerificationErrorData {
  const VerificationErrorData._();

  const factory VerificationErrorData({
    List<String>? errors,
    Map<String, VerificationErrorData>? children,
  }) = _VerificationErrorData;

  factory VerificationErrorData.fromJson(Map<String, dynamic> json) {
    final children = json['children'];
    return _$VerificationErrorDataFromJson({
      ...json,
      'children': children is Map<String, dynamic> ? children : null,
    });
  }

  String? get displayError => errors?.join(', ');
}
