part of '../theme.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: textTheme(),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  ),
  extensions: <ThemeExtension<dynamic>>[
    ThemeColors.light,
    ThemeTextStyles.light,
  ],
);
