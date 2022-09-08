import 'package:flutter/material.dart';
import 'package:flutter_clean_code/presentation/resources/color_manager.dart';
import 'package:flutter_clean_code/presentation/resources/font_manager.dart';
import 'package:flutter_clean_code/presentation/resources/styles_manager.dart';
import 'package:flutter_clean_code/presentation/resources/values_manager.dart';

OutlineInputBorder _buildOutlineInputBorder({Color? borderColor}) {
  return OutlineInputBorder(
    borderSide:  BorderSide(
      color: borderColor ?? ColorManager.primary,
      width: AppSize.s1_5,
    ),
    borderRadius: BorderRadius.circular(AppSize.s8),
  );
}

ThemeData getApplicationTheme() {
  return ThemeData(
    colorScheme: ColorScheme(
      primary: ColorManager.primary,
      onPrimary: ColorManager.primaryOpacity70,
      primaryContainer: ColorManager.primaryOpacity70,
      background: ColorManager.white,
      onBackground: ColorManager.black,
      secondary: ColorManager.grey,
      onSecondary: ColorManager.white,
      secondaryContainer: ColorManager.darkPrimary,
      error: ColorManager.error,
      onError: ColorManager.white,
      surface: ColorManager.white,
      onSurface: ColorManager.black,
      brightness: Brightness.light,
    ),
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.primaryOpacity70,
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.primaryOpacity70,
        titleTextStyle:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16)),
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        splashColor: ColorManager.primaryOpacity70,
        buttonColor: ColorManager.primary),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    textTheme: TextTheme(
      headline1: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
      subtitle1: getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
      caption: getRegularStyle(color: ColorManager.grey1),
      bodyText1: getRegularStyle(color: ColorManager.grey),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.grey1),
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: _buildOutlineInputBorder(borderColor: ColorManager.grey),
      focusedBorder: _buildOutlineInputBorder(),
      errorBorder: _buildOutlineInputBorder(borderColor: ColorManager.error),
      focusedErrorBorder: _buildOutlineInputBorder(),
    ),
  );
}
