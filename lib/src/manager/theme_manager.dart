import 'package:flutter/material.dart';
import 'font_manager.dart';
import 'values_manager.dart';
import 'color_manager.dart';
import 'styles_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    // Main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryLight,
    primaryColorDark: ColorManager.primaryDark,
    disabledColor: ColorManager.lightGrey,
    splashColor: ColorManager.accent,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.accent,
      brightness: Brightness.dark,
    ),

    // CardView theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.accent,
      elevation: AppSize.s4,
    ),
    // AppBar Theme
    appBarTheme: AppBarTheme(
      centerTitle: false,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.accent,
      titleTextStyle: getRegularStyle(
        fontSize: FontSize.s16,
        color: ColorManager.white,
      ),
    ),
    // Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.lightGrey,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primary,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: ColorManager.primary,
        textStyle: getMediumStyle(
          color: ColorManager.dark,
          fontSize: FontSize.s14,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(
            color: ColorManager.white,
          ),
          primary: ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSize.s12,
            ),
          )),
    ), // Text theme
    textTheme: TextTheme(
      headline1: getSemiBoldStyle(
        color: ColorManager.black,
        fontSize: FontSize.s24,
      ),
      headline2: getSemiBoldStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s20,
      ),
      headline3: getSemiBoldStyle(
        color: ColorManager.black,
        fontSize: FontSize.s16,
      ),
      headline4: getRegularStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s14,
      ),
      subtitle1: getMediumStyle(
        color: ColorManager.lightGrey,
        fontSize: FontSize.s14,
      ),
      subtitle2: getMediumStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s12,
      ),
      caption: getRegularStyle(
        color: ColorManager.grey,
      ),
      bodyText1: getRegularStyle(
        color: ColorManager.grey,
      ),
      button: getMediumStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s14,
      ),
    ),
    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(
        AppPadding.p8,
      ),
      hintStyle: getRegularStyle(
        color: ColorManager.grey,
      ),
      labelStyle: getMediumStyle(
        color: ColorManager.darkGrey,
      ),
      errorStyle: getRegularStyle(
        color: ColorManager.error,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.lightGrey,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),
    ),
  );
}
