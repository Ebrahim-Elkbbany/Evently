import 'package:evently/core/theming/app_colors_extension.dart';
import 'package:evently/core/theming/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData get lightTheme =>
      _buildTheme(AppColorsExtension.light, Brightness.dark);
  static ThemeData get darkTheme =>
      _buildTheme(AppColorsExtension.dark, Brightness.light);

  static ThemeData _buildTheme(
    AppColorsExtension colors,
    Brightness brightness,
  ) {
    return ThemeData(
      brightness: brightness,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: colors.background,

      extensions: [colors],
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colors.primary,
        selectionColor: colors.primary.withValues(alpha: 0.3),
        selectionHandleColor: colors.primary,
      ),
      canvasColor: colors.background,
      // 🟢 TextField Theme
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: true,
        fillColor: colors.inputs,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        hintStyle: FontStyles.font14Regular.copyWith(color: colors.mainText),
        errorStyle: TextStyle(color: colors.error, fontSize: 12.sp),
        border: _outlineBorder(colors.stroke),
        enabledBorder: _outlineBorder(colors.stroke),
        focusedBorder: _outlineBorder(colors.primary),
        errorBorder: _outlineBorder(colors.error),
        focusedErrorBorder: _outlineBorder(colors.error),
        disabledBorder: _outlineBorder(colors.stroke),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          textStyle: FontStyles.font16SemiBold,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        ),
      ),

      // 🟣 Card & Divider Theme
      cardTheme: CardThemeData(
        color: colors.inputs,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colors.inputs,
        thickness: 1,
        space: 20.h,
      ),

      // 🔴 Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: colors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),

      // 🟡 Text Theme
      textTheme: TextTheme(
        headlineMedium: FontStyles.font24SemiBold.copyWith(
          color: colors.headLine,
        ),
        displayLarge: FontStyles.font50SemiBold.copyWith(
          color: colors.mainText,
        ),
        titleLarge: FontStyles.font20SemiBold.copyWith(color: colors.mainText),
        bodyLarge: FontStyles.font16SemiBold.copyWith(color: colors.mainText),
        bodyMedium: FontStyles.font16Regular.copyWith(
          color: colors.secondaryText,
        ),
        bodySmall: FontStyles.font14Bold.copyWith(color: colors.mainText),
      ),

      // ⚪ AppBar Theme
      appBarTheme: AppBarTheme(
        titleTextStyle: FontStyles.font20SemiBold.copyWith(
          color: colors.mainText,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: colors.stroke, size: 24.sp),
        backgroundColor: colors.background,
        elevation: 0,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colors.background,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.secondaryText,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  static OutlineInputBorder _outlineBorder(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: BorderSide(color: color),
  );
}
