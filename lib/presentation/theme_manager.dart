import 'package:flutter/material.dart';
import 'package:store_app_advanced/presentation/color_manger.dart';
import 'package:store_app_advanced/presentation/font_manager.dart';
import 'package:store_app_advanced/presentation/style_manager.dart';
import 'package:store_app_advanced/presentation/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
//main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,

    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary, //ripple effect color,

// card view

    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    )

// app bar theme
    ,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularStyle(
        fontSize: FontSize.s16,
        color: ColorManager.white,
      ),
    ),

// button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),
// elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s17),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

// text theme

    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
          color: ColorManager.darkGrey, fontSize: FontSize.s16), //headLine1
      titleMedium: getMediumStyle(
          color: ColorManager.lightGrey, fontSize: FontSize.s14), //subtitle
      bodySmall: getRegularStyle(color: ColorManager.grey1), // caption
      bodyLarge:
          getRegularStyle(color: ColorManager.grey), //bodyText1 previously

      displayMedium: getLightStyle(
          color: ColorManager.white,
          fontSize: FontSize.s22), // displayMedium in the
    ),
// input decoration theme (text form fieled)

    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      // hint style
      hintStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),

      labelStyle:
          getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),

      errorStyle:
          getRegularStyle(color: ColorManager.error, fontSize: FontSize.s14),

      // enabled border
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

      // focused border style
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      // error border style
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

      // focused error border style
      focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    ),
  );
}
