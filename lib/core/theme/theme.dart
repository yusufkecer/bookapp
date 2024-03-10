import 'package:bookapp/core/theme/colors.dart';
import 'package:flutter/material.dart';

class Theme {
  static final ThemeData baseLight = ThemeData.light();
  static final ThemeData baseDark = ThemeData.dark();

  static ThemeData get lightTheme {
    return baseLight.copyWith(
      textTheme: _lightTextTheme,
      hintColor: kAccentColor,
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kPrimaryColor,
      appBarTheme: _appBarTheme,
      floatingActionButtonTheme: _fabTheme,
      errorColor: kErrorColor,
    );
  }

  static TextTheme get _lightTextTheme {
    return TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: kTextTitleColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 17.0,
        color: kGreyColor,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 17.0,
        color: kAccentColor,
      ),
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      elevation: 0,
      color: kPrimaryColor,
      titleTextStyle: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: kTextTitleColor,
      ),
      iconTheme: IconThemeData(
        color: kTextTitleColor,
      ),
    );
  }

  static FloatingActionButtonThemeData get _fabTheme => FloatingActionButtonThemeData(backgroundColor: kAccentColor);

  static ThemeData get darkTheme {
    return baseDark.copyWith(
      textTheme: _darkTextTheme,
      primaryColor: kPrimaryColorDark,
      scaffoldBackgroundColor: kPrimaryColorDark,
      appBarTheme: _appBarThemeDark,
      floatingActionButtonTheme: _fabThemeDark,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: kAccentColorDark)
          .copyWith(background: kAccentColorDark)
          .copyWith(error: kErrorColorDark),
    );
  }

  static TextTheme get _darkTextTheme {
    return TextTheme(
      titleMedium: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 17.0,
        color: kGreyColorDark,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 17.0,
        color: kAccentColorDark,
      ),
    );
  }

  static FloatingActionButtonThemeData get _fabThemeDark =>
      FloatingActionButtonThemeData(backgroundColor: kAccentColorDark, foregroundColor: Colors.white);

  static AppBarTheme get _appBarThemeDark {
    return AppBarTheme(
      elevation: 0,
      color: kPrimaryColorDark,
      titleTextStyle: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: kTextTitleColorDark,
      ),
      iconTheme: IconThemeData(
        color: kTextTitleColorDark,
      ),
    );
  }
}
