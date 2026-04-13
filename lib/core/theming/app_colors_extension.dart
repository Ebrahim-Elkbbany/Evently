import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color primary;
  final Color disable;
  final Color mainText;
  final Color secondaryText;
  final Color background;
  final Color inputs;
  final Color stroke;
  final Color red;
  final Color error;
  final Color success;
  final Color warning;
  final Color headLine;
  final Color white;
  final Color bottomNavColor;

  const AppColorsExtension({
    required this.primary,
    required this.disable,
    required this.mainText,
    required this.secondaryText,
    required this.background,
    required this.inputs,
    required this.stroke,
    required this.red,
    required this.error,
    required this.success,
    required this.warning,
    required this.headLine,
    required this.white,
    required this.bottomNavColor,
  });

  @override
  AppColorsExtension copyWith({
    Color? primary,
    Color? disable,
    Color? textPrimary,
    Color? textSecondary,
    Color? background,
    Color? surface,
    Color? iconColor,
    Color? buttonColor,
    Color? error,
    Color? success,
    Color? warning,
    Color? headLine,
    Color? white,
    Color? bottomNavColor,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      disable: disable ?? this.disable,
      mainText: textPrimary ?? mainText,
      secondaryText: textSecondary ?? secondaryText,
      background: background ?? this.background,
      inputs: surface ?? inputs,
      stroke: iconColor ?? stroke,
      red: buttonColor ?? red,
      error: error ?? this.error,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      headLine: headLine ?? this.headLine,
      white: white ?? this.white,
      bottomNavColor: bottomNavColor ?? this.bottomNavColor,
    );
  }

  @override
  AppColorsExtension lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) return this;
    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      disable: Color.lerp(disable, other.disable, t)!,
      mainText: Color.lerp(mainText, other.mainText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      background: Color.lerp(background, other.background, t)!,
      inputs: Color.lerp(inputs, other.inputs, t)!,
      stroke: Color.lerp(stroke, other.stroke, t)!,
      red: Color.lerp(red, other.red, t)!,
      error: Color.lerp(error, other.error, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      headLine: Color.lerp(headLine, other.headLine, t)!,
      white: Color.lerp(white, other.white, t)!,
      bottomNavColor: Color.lerp(bottomNavColor, other.bottomNavColor, t)!,
    );
  }

  static const Color _primary = Color(0xff0E3A99);
  static const Color _primaryDark = Color(0xff457AED);
  static const Color _disable = Color(0xffB9B9B9);
  static const Color _mainTextLight = Color(0xff1C1C1C);
  static const Color _mainTextDark = Color(0xffFFFFFF);
  static const Color _secTextLight = Color(0xff686868);
  static const Color _secTextDark = Color(0xffD6D6D6);
  static const Color _backgroundLight = Color(0xffF4F7FF);
  static const Color _backgroundDark = Color(0xff000F30);
  static const Color _inputsLight = Color(0xffFFFFFF);
  static const Color _inputsDark = Color(0xff001440);
  static const Color _strokeLight = Color(0xffF0F0F0);
  static const Color _strokeDark = Color(0xff002D8F);
  static const Color _red = Color(0xffFF3232);
  static const Color _white = Colors.white;

  static const Color _errorLight = Color(0xFFD32F2F);
  static const Color _errorDark = Color(0xFFEF5350);
  static const Color _successLight = Color(0xFF2E7D32);
  static const Color _successDark = Color(0xFF66BB6A);
  static const Color _warningLight = Color(0xFFED6C02);
  static const Color _warningDark = Color(0xFFFFA726);

  static const light = AppColorsExtension(
    headLine: _primary,
    primary: _primary,
    disable: _disable,
    mainText: _mainTextLight,
    secondaryText: _secTextLight,
    background: _backgroundLight,
    inputs: _inputsLight,
    stroke: _strokeLight,
    red: _red,
    error: _errorLight,
    success: _successLight,
    warning: _warningLight,
    white: _white,
    bottomNavColor: _white,
  );

  static const dark = AppColorsExtension(
    headLine: _white,
    primary: _primaryDark,
    disable: _disable,
    mainText: _mainTextDark,
    secondaryText: _secTextDark,
    background: _backgroundDark,
    inputs: _inputsDark,
    stroke: _strokeDark,
    red: _red,
    error: _errorDark,
    success: _successDark,
    warning: _warningDark,
    white: _white,
    bottomNavColor: _backgroundDark,
  );
}
