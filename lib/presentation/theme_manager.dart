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

// text theme

// input decoration theme (text form fieled)
  );
}
