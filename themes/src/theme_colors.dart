// ignore_for_file: prefer_constructors_over_static_methods

part of '../theme.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.white,
    required this.green,
    required this.red,
    required this.orange,
    required this.yellow,
    required this.purple,
    required this.mainColor,
    required this.mainPressed,
    required this.mainTxt,
    required this.menuTxt,
    required this.grey,
    required this.tabBack,
    required this.lightGrey,
    required this.darkGrey,
    required this.stroke,
    required this.block,
    required this.purpleLight,
    required this.transparent,
  });

  final Color white;
  final Color green;
  final Color red;
  final Color orange;
  final Color yellow;
  final Color purple;
  final Color mainColor;
  final Color mainPressed;
  final Color mainTxt;
  final Color menuTxt;
  final Color grey;
  final Color tabBack;
  final Color lightGrey;
  final Color darkGrey;
  final Color stroke;
  final Color block;
  final Color purpleLight;
  final Color transparent;

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? white,
    Color? green,
    Color? red,
    Color? orange,
    Color? yellow,
    Color? purple,
    Color? mainColor,
    Color? mainPressed,
    Color? mainTxt,
    Color? menuTxt,
    Color? grey,
    Color? tabBack,
    Color? lightGrey,
    Color? darkGrey,
    Color? stroke,
    Color? block,
    Color? purpleLight,
    Color? transparent,
  }) {
    return ThemeColors(
      white: white ?? this.white,
      green: green ?? this.green,
      red: red ?? this.red,
      orange: orange ?? this.orange,
      yellow: yellow ?? this.yellow,
      purple: purple ?? this.purple,
      mainColor: mainColor ?? this.mainColor,
      mainPressed: mainPressed ?? this.mainPressed,
      mainTxt: mainTxt ?? this.mainTxt,
      menuTxt: menuTxt ?? this.menuTxt,
      grey: grey ?? this.grey,
      tabBack: tabBack ?? this.tabBack,
      lightGrey: lightGrey ?? this.lightGrey,
      darkGrey: darkGrey ?? this.darkGrey,
      stroke: stroke ?? this.stroke,
      block: block ?? this.block,
      purpleLight: purpleLight ?? this.purpleLight,
      transparent: transparent ?? this.transparent,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
      white: Color.lerp(white, other.white, t)!,
      green: Color.lerp(green, other.green, t)!,
      red: Color.lerp(red, other.red, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
      yellow: Color.lerp(yellow, other.yellow, t)!,
      purple: Color.lerp(purple, other.purple, t)!,
      mainColor: Color.lerp(mainColor, other.mainColor, t)!,
      mainPressed: Color.lerp(mainPressed, other.mainPressed, t)!,
      mainTxt: Color.lerp(mainTxt, other.mainTxt, t)!,
      menuTxt: Color.lerp(menuTxt, other.menuTxt, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      tabBack: Color.lerp(tabBack, other.tabBack, t)!,
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t)!,
      darkGrey: Color.lerp(darkGrey, other.darkGrey, t)!,
      stroke: Color.lerp(stroke, other.stroke, t)!,
      block: Color.lerp(block, other.block, t)!,
      purpleLight: Color.lerp(purpleLight, other.purpleLight, t)!,
      transparent: Color.lerp(transparent, other.transparent, t)!,
    );
  }

  static ThemeColors get light => ThemeColors(
        white: AppColors.white,
        green: AppColors.green,
        red: AppColors.red,
        orange: AppColors.orange,
        yellow: AppColors.yellow,
        purple: AppColors.purple,
        mainColor: AppColors.mainColor[AppConstants.DAY],
        mainPressed: AppColors.mainPressed[AppConstants.DAY],
        mainTxt: AppColors.mainTxt[AppConstants.DAY],
        menuTxt: AppColors.menuTxt[AppConstants.DAY],
        grey: AppColors.grey[AppConstants.DAY],
        tabBack: AppColors.tabBack[AppConstants.DAY],
        lightGrey: AppColors.lightGrey[AppConstants.DAY],
        darkGrey: AppColors.darkGrey[AppConstants.DAY],
        stroke: AppColors.stroke[AppConstants.DAY],
        block: AppColors.block[AppConstants.DAY],
        purpleLight: AppColors.purpleLight[AppConstants.DAY],
        transparent: AppColors.transparent,
      );

  static ThemeColors get dark => ThemeColors(
        white: AppColors.white,
        green: AppColors.green,
        red: AppColors.red,
        orange: AppColors.orange,
        yellow: AppColors.yellow,
        purple: AppColors.purple,
        mainColor: AppColors.mainColor[AppConstants.NIGHT],
        mainPressed: AppColors.mainPressed[AppConstants.NIGHT],
        mainTxt: AppColors.mainTxt[AppConstants.NIGHT],
        menuTxt: AppColors.menuTxt[AppConstants.NIGHT],
        grey: AppColors.grey[AppConstants.NIGHT],
        tabBack: AppColors.tabBack[AppConstants.NIGHT],
        lightGrey: AppColors.lightGrey[AppConstants.NIGHT],
        darkGrey: AppColors.darkGrey[AppConstants.NIGHT],
        stroke: AppColors.stroke[AppConstants.NIGHT],
        block: AppColors.block[AppConstants.NIGHT],
        purpleLight: AppColors.purpleLight[AppConstants.NIGHT],
        transparent: AppColors.transparent,
      );
}
