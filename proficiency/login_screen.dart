import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:panodyssey_domain/panodyssey_domain.dart';
import 'package:panodyssey_ui/common/theme/palette.dart';
import 'package:panodyssey_ui/common/theme/text_styles.dart';
import 'package:panodyssey_ui/common/utils/dialog_utils.dart';
import 'package:panodyssey_ui/common/widgets/app_button/app_button.dart';
import 'package:panodyssey_ui/common/widgets/app_text_field/app_text_field.dart';
import 'package:panodyssey_ui/common/widgets/app_top_bar/app_top_bar.dart';
import 'package:panodyssey_ui/common/widgets/bloc_loading_indicator.dart';
import 'package:panodyssey_ui/common/widgets/keyboard_sticky_widget/keyboard_sticky_page.dart';
import 'package:panodyssey_ui/onboarding/mixins/required_fields_filled_mixin.dart';
import 'package:panodyssey_ui/common/utils/validators.dart';
import 'package:panodyssey_ui/onboarding/widgets/authentication_page_footer.dart';
import 'package:panodyssey_ui/onboarding/widgets/authentication_services_provider.dart';
import 'package:panodyssey_ui/onboarding/widgets/forgot_password_button.dart';
import 'package:panodyssey_ui/onboarding/widgets/labeled_splitter.dart';
import 'package:panodyssey_ui/onboarding/widgets/terms_and_conditions_text.dart';
import 'package:panodyssey_ui/profile/screens/email_verification_notification_screen/email_verification_notification_screen.dart';
import 'package:panodyssey_ui/router/router.dart';

import '../widgets/authentication_method_buttons/apple_authentication_button.dart';
import '../widgets/authentication_method_buttons/facebook_authentication_button.dart';
import '../widgets/authentication_method_buttons/google_authentication_button.dart';

class SigninScreenWrapper extends StatelessWidget {
  const SigninScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthenticationServicesProvider(
      child: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(
          authenticationClient: context.read(),
        ),
        child: const SigninScreen(),
      ),
    );
  }
}

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> with RequiredFieldsFilled {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: BlocLoadingIndicator<LoginCubit, LoginState>(
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            state.whenOrNull(
              passed: () async {
                final router = GoRouter.of(context);
                final profileProvider = context.read<ProfileProvider>();
                if (!(profileProvider.user?.isEmailVerified ?? false)) {
                  await DialogUtils.showCupertinoBottomSheet(
                    context,
                    builder: (_) => const EmailVerificationNotificationScreen(),
                  );
                }
                router.go(AppRoute.feed.path);
              },
            );
          },
          child: Scaffold(
            appBar: AppTopBar.title(LocaleKeys.login_title.tr()),
            backgroundColor: Palette.of(context).neutralsWhite,
            body: KeyboardStickyPage(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 24.h,
                  bottom: 50.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              LocaleKeys.login_welcome.tr(),
                              style: TextStyles.header0,
                              textAlign: TextAlign.center,
                            ),
                            24.verticalSpace,
                            FacebookAuthenticationButton.signIn(
                              onPressed: () {
                                _handleFacebookLogin(context);
                              },
                            ),
                            8.verticalSpace,
                            GoogleAuthenticationButton.signIn(
                              onPressed: () {
                                _handleGoogleLogin(context);
                              },
                            ),
                            if (Platform.isIOS) ...[
                              8.verticalSpace,
                              AppleAuthenticationButton.signIn(
                                onPressed: () {
                                  _handleAppleLogin(context);
                                },
                              ),
                            ],
                            16.verticalSpace,
                            LabledSplitter(
                                label: LocaleKeys.login_splitter.tr()),
                            16.verticalSpace,
                            BlocSelector<LoginCubit, LoginState, LoginError?>(
                              selector: (state) => state.whenOrNull(
                                error: (error) => error,
                              ),
                              builder: (context, error) => AppTextField(
                                label: LocaleKeys.login_email.tr(),
                                hintText: LocaleKeys.login_yourEmail.tr(),
                                validator: Validators.email,
                                controller: _emailController,
                                errorText: error?.whenOrNull(
                                  incorrectEmailOrPassword: () => LocaleKeys
                                      .login_incorrectEmailOrPassword
                                      .tr(),
                                ),
                              ),
                            ),
                            16.verticalSpace,
                            AppTextField.password(
                              label: LocaleKeys.login_password.tr(),
                              hintText: LocaleKeys.login_yourPassword.tr(),
                              obscureText: _obscurePassword,
                              onEyePressed: _togglePasswordVisibility,
                              controller: _passwordController,
                            ),
                            16.verticalSpace,
                            AppButton.primaryBlue(
                              label: LocaleKeys.login_buttonLogin.tr(),
                              onPressed:
                                  requiredFieldsFilled ? _handleLogin : null,
                              expanded: true,
                            ),
                            12.verticalSpace,
                            TermsAndConditionsText.common(
                              textStyle: GoogleFonts.lato(
                                textStyle: TextStyles.footnote,
                                fontSize: 11.sp,
                              ),
                              color: Palette.of(context).primaryBlue,
                              shouldUnderline: true,
                            ),
                            16.verticalSpace,
                            const ForgotPasswordButton(),
                          ],
                        ),
                      ),
                    ),
                    36.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: AuthenticationPageFooter.login(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleFacebookLogin(BuildContext context) async {
    final cubit = context.read<LoginCubit>();
    cubit.clearError();
    await cubit.facebookLogin();
  }

  void _handleGoogleLogin(BuildContext context) async {
    final cubit = context.read<LoginCubit>();
    cubit.clearError();
    await cubit.googleLogin();
  }

  void _handleAppleLogin(BuildContext context) async {
    final cubit = context.read<LoginCubit>();
    cubit.clearError();
    await cubit.appleLogin();
  }

  void _handleLogin() async {
    final cubit = context.read<LoginCubit>();
    cubit.clearError();
    if (_formKey.currentState?.validate() ?? false) {
      await cubit.login(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  List<TextEditingController> get requiredFieldsControllers => [
        _emailController,
        _passwordController,
      ];
}
