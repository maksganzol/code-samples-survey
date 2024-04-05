part of '../theme.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: textTheme(),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  ),
  extensions: <ThemeExtension<dynamic>>[
    ThemeColors.dark,
    ThemeTextStyles.dark,
  ],
);
