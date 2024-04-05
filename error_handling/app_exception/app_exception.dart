import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panodyssey_core/app_exception/verification_error_data.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException {
  const factory AppException.unknown([Object? error]) = AppExceptionUnknown;
  const factory AppException.badConnection() = _BadConnection;
  const factory AppException.badRequest([String? message]) =
      AppExceptionBadRequest;
  const factory AppException.invalidData(VerificationErrorData data) =
      AppExceptionInvalidData;
  const factory AppException.securedStorageWriting(
    PlatformException exception,
  ) = AppExceptionSecuredStorageWrite;

  const factory AppException.securedStorageReading(
    PlatformException exception,
  ) = AppExceptionSecuredStorageReading;

  const factory AppException.localStorageWriting([Object? error]) =
      AppExceptionLocalStorageWriting;

  const factory AppException.localStorageReading([Object? error]) =
      AppExceptionLocalStorageReading;

  const factory AppException.invalidCredentials() =
      AppExceptionInvalidCredentials;

  const factory AppException.unauthorized() = AppExceptionUnauthorized;

  const factory AppException.socialLogin([Object? error]) =
      AppExeptionSocialLogin;

  const factory AppException.inAppPurchase([Object? error]) =
      AppExeptionInAppPurchase;

  const factory AppException.firebaseCloudMessaging([Object? error]) =
      AppExceptionFirebaseCloudMessaging;

  const factory AppException.emptyMessagingToken() =
      AppExceptionEmptyMessagingToken;

  const factory AppException.firebaseAuth(FirebaseException exception) =
      AppExceptionFirebaseAuth;

  const factory AppException.firebaseAuthUnauthorized() =
      AppExceptionFirebaseAuthUnauthorized;

  const factory AppException.firestore(FirebaseException exception) =
      AppExceptionFirestore;

  const factory AppException.contentBlocked() = AppExceptionContentBlocked;

  const factory AppException.reviewNotAvailable() = ReviewNotAvailable;
  const factory AppException.inAppReviewError([Object? error]) =
      InAppReviewError;

  factory AppException.fromDioException(DioException exception) {
    if (exception.type == DioExceptionType.connectionError ||
        exception.type == DioExceptionType.connectionTimeout) {
      return const AppException.badConnection();
    }

    final statusCode = exception.response?.statusCode;
    if (statusCode == HttpStatus.badRequest) {
      return AppException.badRequest(exception.response?.data['message']);
    }
    if (statusCode == HttpStatus.unauthorized) {
      return const AppException.invalidCredentials();
    }
    if (statusCode == HttpStatus.unprocessableEntity) {
      final data = exception.response?.data;
      if (data == null) {
        return const AppException.invalidData(VerificationErrorData());
      }
      return AppException.invalidData(VerificationErrorData.fromJson(data));
    }
    return AppException.unknown(exception);
  }
}
