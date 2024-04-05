import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:panodyssey_core/panodyssey_core.dart';
import 'package:panodyssey_core/utils/success_result.dart';
import 'package:panodyssey_domain/providers/profile_provider/profile_provider.dart';

class AuthenticationClient {
  AuthenticationClient({
    required AuthenticationRestApi api,
    required SecureStorage secureStorage,
    required ProfileProvider profileProvider,
    required FacebookAuthService facebookAuthService,
    required GoogleAuthService googleAuthService,
    required AppleAuthService appleAuthService,
  })  : _api = api,
        _secureStorage = secureStorage,
        _profileProvider = profileProvider,
        _facebookAuthService = facebookAuthService,
        _googleAuthService = googleAuthService,
        _appleAuthService = appleAuthService;

  final AuthenticationRestApi _api;
  final SecureStorage _secureStorage;
  final ProfileProvider _profileProvider;
  final FacebookAuthService _facebookAuthService;
  final GoogleAuthService _googleAuthService;
  final AppleAuthService _appleAuthService;

  Future<Either<AppException, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      final tokenEntity = await _api.login(
        LoginRequest(username: email, password: password),
      );

      return _saveTokenAndUser(tokenEntity);
    } on DioException catch (exception) {
      return Left(AppException.fromDioException(exception));
    } catch (error) {
      Fimber.e('Unknown error', ex: error, stacktrace: StackTrace.current);
      return Left(AppException.unknown(error));
    }
  }

  Future<Either<AppException, void>> loginViaFacebook() async {
    try {
      Fimber.d("Facebook: Start send token to server");
      final token = await _facebookAuthService.auth();
      final facebookAuthResult = await _api.facebookAuth(code: token);
      return _saveTokenAndUser(facebookAuthResult);
    } on DioException catch (exception, stacktrace) {
      Fimber.d("Facebook: Dio error", ex: exception, stacktrace: stacktrace);
      return Left(AppException.fromDioException(exception));
    } catch (error, stacktrace) {
      Fimber.d("Facebook: error", ex: error, stacktrace: stacktrace);
      Fimber.e('Unknown error', ex: error, stacktrace: StackTrace.current);
      return Left(AppException.unknown(error));
    }
  }

  Future<Either<AppException, void>> loginViaGoogle() async {
    try {
      Fimber.d("Google: Start send token to server");
      final token = await _googleAuthService.auth();
      final googleAuthResult = await _api.googleAuth(code: token);
      return _saveTokenAndUser(googleAuthResult);
    } on DioException catch (exception, stacktrace) {
      Fimber.d("Google: Dio error", ex: exception, stacktrace: stacktrace);
      return Left(AppException.fromDioException(exception));
    } catch (error, stacktrace) {
      Fimber.d("Google: error", ex: error, stacktrace: stacktrace);
      Fimber.e('Unknown error', ex: error, stacktrace: StackTrace.current);
      return Left(AppException.unknown(error));
    }
  }

  Future<Either<AppException, void>> loginViaApple() async {
    try {
      final appleUser = await _appleAuthService.auth();
      final appleAuthResult = await _api.appleAuth(
        code: appleUser.authorizationCode,
        firstName: appleUser.firstName,
        lastName: appleUser.lastName,
      );
      return _saveTokenAndUser(appleAuthResult);
    } on DioException catch (exception, stacktrace) {
      Fimber.d("Apple auth: Dio error", ex: exception, stacktrace: stacktrace);
      return Left(AppException.fromDioException(exception));
    } catch (error, stacktrace) {
      Fimber.d("Apple auth: error", ex: error, stacktrace: stacktrace);
      Fimber.e('Unknown error', ex: error, stacktrace: StackTrace.current);
      return Left(AppException.unknown(error));
    }
  }

  Future<Either<AppException, void>> signUpCommon({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String passwordConfirmation,
    required bool termsAgreed,
  }) async {
    try {
      final tokenEntity = await _api.register(
        CreateUserRequest(
          firstName: firstName,
          lastName: lastName,
          email: email,
          plainPassword: PlainPassword(
            first: password,
            second: passwordConfirmation,
          ),
          termsAgreed: termsAgreed,
        ),
      );

      return _saveTokenAndUser(tokenEntity);
    } on DioException catch (exception) {
      return Left(AppException.fromDioException(exception));
    } catch (error) {
      Fimber.e('Unknown error', ex: error, stacktrace: StackTrace.current);
      return Left(AppException.unknown(error));
    }
  }

  Future<Either<AppException, void>> signUpPro({
    required String email,
    required String companyName,
    required String brandName,
    required String password,
    required String passwordConfirmation,
    required OrganizationStatus organizationStatus,
    required String accoutnNumber,
    required String vatNumber,
    required String addressStreet,
    required String postcode,
    required String city,
    required int countryCode,
    required int? regionCode,
  }) async {
    try {
      final address = AddressRequest(
        address: addressStreet,
        zipCode: postcode,
        city: city,
        country: countryCode,
        region: regionCode,
      );
      final company = CompanyRequest(
        name: companyName,
        businessType: organizationStatus,
        number: accoutnNumber,
        vatNumber: vatNumber,
        address: address,
      );

      final plainPassword = PlainPassword(
        first: password,
        second: passwordConfirmation,
      );

      final tokenEntity = await _api.registerPro(
        CreateProUserRequest(
          email: email,
          plainPassword: plainPassword,
          pseudo: brandName,
          company: company,
        ),
      );

      return _saveTokenAndUser(tokenEntity);
    } on DioException catch (exception) {
      return Left(AppException.fromDioException(exception));
    } catch (error) {
      Fimber.e('Unknown error', ex: error, stacktrace: StackTrace.current);
      return Left(AppException.unknown(error));
    }
  }

  Future<Either<AppException, void>> _saveTokenAndUser(
    TokenResponse tokenResponse,
  ) async {
    final saveTokenResult = await _secureStorage.write(
      SecureStorageKeys.authenticationToken,
      tokenResponse.token,
    );
    final fetchUserResult = await saveTokenResult.asyncBind(
      (_) => _profileProvider.fetchUserAndSaveFCMToken(),
    );
    return fetchUserResult;
  }

  Future<Either<AppException, void>> confirmEmail({
    required String token,
  }) async {
    try {
      await _api.confirmEmail(
        ConfirmEmailRequest(tokenConfirmation: token),
      );
      return const SuccessResult();
    } on DioException catch (exception) {
      return Left(AppException.fromDioException(exception));
    } catch (error) {
      Fimber.e('Unknown error', ex: error, stacktrace: StackTrace.current);
      return Left(AppException.unknown(error));
    }
  }

  Future<Either<AppException, void>> resendVerificationEmail() async {
    try {
      await _api.resendEmail();
      return const SuccessResult();
    } on DioException catch (exception) {
      return Left(AppException.fromDioException(exception));
    } catch (error) {
      Fimber.e('Unknown error', ex: error, stacktrace: StackTrace.current);
      return Left(AppException.unknown(error));
    }
  }
}
