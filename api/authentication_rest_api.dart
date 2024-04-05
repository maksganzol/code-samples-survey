import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'requests/confirm_email_request.dart';
import 'requests/create_pro_user_request.dart';
import 'requests/create_user_request.dart';
import 'requests/login_request.dart';
import 'responses/token_response.dart';

part 'authentication_rest_api.g.dart';

@RestApi()
abstract class AuthenticationRestApi {
  factory AuthenticationRestApi(Dio dio) = _AuthenticationRestApi;

  @POST('/v1/login_check')
  Future<TokenResponse> login(
    @Body() LoginRequest requestModel,
  );

  @POST('/v1/register')
  Future<TokenResponse> register(@Body() CreateUserRequest requestModel);

  @POST('/v1/register/pro')
  Future<TokenResponse> registerPro(
    @Body() CreateProUserRequest requestModel,
  );

  @GET('/v1/facebook/check')
  Future<TokenResponse> facebookAuth({
    @Query('code') required String code,
  });

  @GET('/v1/google/check')
  Future<TokenResponse> googleAuth({
    @Query('code') required String code,
  });

  @GET('/v1/apple/check')
  Future<TokenResponse> appleAuth({
    @Query('code') required String code,
    @Query('firstName') required String? firstName,
    @Query('lastName') required String? lastName,
  });

  @POST('/v1/confirm')
  Future<void> confirmEmail(
    @Body() ConfirmEmailRequest requestModel,
  );

  @POST('/v1/email/confirm/resend')
  Future<void> resendEmail();
}
