// ignore_for_file: prefer_constructors_over_static_methods

part of '../theme.dart';

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  ThemeTextStyles({
    required this.h1Bold32,
    required this.h2Bold22,
    required this.h3Bold18,
    required this.h4Bold16,
    required this.h5Bold14,
    required this.bodyMed16,
    required this.bodyMed14,
    required this.bodyReg16,
    required this.bodyReg14,
    required this.bodyBold12,
    required this.bodyReg12,
    required this.button,
    required this.bodyXsRegDM10,
  });

  final TextStyle h1Bold32;
  final TextStyle h2Bold22;
  final TextStyle h3Bold18;
  final TextStyle h4Bold16;
  final TextStyle h5Bold14;
  final TextStyle bodyMed16;
  final TextStyle bodyMed14;
  final TextStyle bodyReg16;
  final TextStyle bodyReg14;
  final TextStyle bodyBold12;
  final TextStyle bodyReg12;
  final TextStyle button;
  final TextStyle bodyXsRegDM10;

  @override
  ThemeExtension<ThemeTextStyles> copyWith({
    TextStyle? h1Bold32,
    TextStyle? h2Bold22,
    TextStyle? h3Bold18,
    TextStyle? h4Bold16,
    TextStyle? h5Bold14,
    TextStyle? bodyMed16,
    TextStyle? bodyMed14,
    TextStyle? bodyReg16,
    TextStyle? bodyReg14,
    TextStyle? bodyBold12,
    TextStyle? bodyReg12,
    TextStyle? button,
    TextStyle? bodyXsRegDM10,
  }) {
    return ThemeTextStyles(
      h1Bold32: h1Bold32 ?? this.h1Bold32,
      h2Bold22: h2Bold22 ?? this.h2Bold22,
      h3Bold18: h3Bold18 ?? this.h3Bold18,
      h4Bold16: h4Bold16 ?? this.h4Bold16,
      h5Bold14: h5Bold14 ?? this.h5Bold14,
      bodyMed16: bodyMed16 ?? this.bodyMed16,
      bodyMed14: bodyMed14 ?? this.bodyMed14,
      bodyReg16: bodyReg16 ?? this.bodyReg16,
      bodyReg14: bodyReg14 ?? this.bodyReg14,
      bodyBold12: bodyBold12 ?? this.bodyBold12,
      bodyReg12: bodyReg12 ?? this.bodyReg12,
      button: button ?? this.button,
      bodyXsRegDM10: bodyXsRegDM10 ?? this.bodyXsRegDM10,
    );
  }

  @override
  ThemeExtension<ThemeTextStyles> lerp(
    ThemeExtension<ThemeTextStyles>? other,
    double t,
  ) {
    if (other is! ThemeTextStyles) {
      return this;
    }

    return ThemeTextStyles(
      h1Bold32: TextStyle.lerp(h1Bold32, other.h1Bold32, t)!,
      h2Bold22: TextStyle.lerp(h2Bold22, other.h2Bold22, t)!,
      h3Bold18: TextStyle.lerp(h3Bold18, other.h3Bold18, t)!,
      h4Bold16: TextStyle.lerp(h4Bold16, other.h4Bold16, t)!,
      h5Bold14: TextStyle.lerp(h5Bold14, other.h5Bold14, t)!,
      bodyMed16: TextStyle.lerp(bodyMed16, other.bodyMed16, t)!,
      bodyMed14: TextStyle.lerp(bodyMed14, other.bodyMed14, t)!,
      bodyReg16: TextStyle.lerp(bodyReg16, other.bodyReg16, t)!,
      bodyReg14: TextStyle.lerp(bodyReg14, other.bodyReg14, t)!,
      bodyBold12: TextStyle.lerp(bodyBold12, other.bodyBold12, t)!,
      bodyReg12: TextStyle.lerp(bodyReg12, other.bodyReg12, t)!,
      button: TextStyle.lerp(button, other.button, t)!,
      bodyXsRegDM10: TextStyle.lerp(bodyXsRegDM10, other.bodyXsRegDM10, t)!,
    );
  }

  static ThemeTextStyles get light => ThemeTextStyles(
        h1Bold32: AppTextStyle.h1Bold32,
        h2Bold22: AppTextStyle.h2Bold22,
        h3Bold18: AppTextStyle.h3Bold18,
        h4Bold16: AppTextStyle.h4Bold16,
        h5Bold14: AppTextStyle.h5Bold14,
        bodyMed16: AppTextStyle.bodyMed16,
        bodyMed14: AppTextStyle.bodyMed14,
        bodyReg16: AppTextStyle.bodyReg16,
        bodyReg14: AppTextStyle.bodyReg14,
        bodyBold12: AppTextStyle.bodyBold12,
        bodyReg12: AppTextStyle.bodyReg12,
        button: AppTextStyle.button,
        bodyXsRegDM10: AppTextStyle.bodyXsRegDM10,
      );

  static ThemeTextStyles get dark => ThemeTextStyles(
        h1Bold32: AppTextStyle.h1Bold32,
        h2Bold22: AppTextStyle.h2Bold22,
        h3Bold18: AppTextStyle.h3Bold18,
        h4Bold16: AppTextStyle.h4Bold16,
        h5Bold14: AppTextStyle.h5Bold14,
        bodyMed16: AppTextStyle.bodyMed16,
        bodyMed14: AppTextStyle.bodyMed14,
        bodyReg16: AppTextStyle.bodyReg16,
        bodyReg14: AppTextStyle.bodyReg14,
        bodyBold12: AppTextStyle.bodyBold12,
        bodyReg12: AppTextStyle.bodyReg12,
        button: AppTextStyle.button,
        bodyXsRegDM10: AppTextStyle.bodyXsRegDM10,
      );
}
