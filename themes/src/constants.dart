part of '../theme.dart';

final baseSansStyle = GoogleFonts.dmSans(
  textStyle: const TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
  ),
);

final basePoppinsStyle = GoogleFonts.poppins(
  textStyle: const TextStyle(
    fontStyle: FontStyle.normal,
  ),
);

abstract class AppTextStyle {
  static final h1Bold32 = baseSansStyle.copyWith(fontSize: 32.sp);
  static final h2Bold22 = baseSansStyle.copyWith(fontSize: 22.sp);
  static final h3Bold18 = baseSansStyle.copyWith(fontSize: 18.sp);
  static final h4Bold16 = baseSansStyle.copyWith(fontSize: 16.sp);
  static final h5Bold14 = baseSansStyle.copyWith(fontSize: 14.sp);
  static final bodyMed16 = basePoppinsStyle.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  static final bodyMed14 = baseSansStyle.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static final bodyReg16 = basePoppinsStyle.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static final bodyReg14 = basePoppinsStyle.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static final bodyBold12 = basePoppinsStyle.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
  );
  static final bodyReg12 = basePoppinsStyle.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  static final button = baseSansStyle.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static final bodyXsRegDM10 = baseSansStyle.copyWith(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
  );
}

abstract class AppColors {
  static const transparent = Colors.transparent;
  static const white = Color(0xFFFFFFFF);
  static const green = Color(0xFF27AE60);
  static const red = Color(0xFFEB5757);
  static const orange = Color(0xFFFA8417);
  static const yellow = Color(0xFFF2C94C);
  static const purple = Color(0xFF9141F5);
  static const mainColor = [Color(0xFF0066FF), Color(0xFF0066FF)];
  static const mainPressed = [Color(0xFF2955BF), Color(0xFF2955BF)];
  static const mainTxt = [Color(0xFF423994), Color(0xFF423994)];
  static const grey = [Color(0xFF777E90), Color(0xFF777E90)];
  static const tabBack = [Color(0xFFDCE6FF), Color(0xFFDCE6FF)];
  static const lightGrey = [Color(0xFFB1B5C4), Color(0xFFB1B5C4)];
  static const darkGrey = [Color(0xFF212E3E), Color(0xFF212E3E)];
  static const stroke = [Color(0xFFDDE7FF), Color(0xFFDDE7FF)];
  static const block = [Color(0xFFFCFCFD), Color(0xFFFCFCFD)];
  static const menuTxt = [Color(0xFF635AA9), Color(0xFF635AA9)];
  static const purpleLight = [Color(0xFFB362F2), Color(0xFFB362F2)];
}
