

import 'package:feroo_store/core/style/colors/colors_dark.dart';
import 'package:feroo_store/core/style/colors/colors_light.dart';
import 'package:feroo_store/core/style/font/font_family_helper.dart';
import 'package:feroo_store/core/style/theme/assets_extension.dart';
import 'package:feroo_store/core/style/theme/color_extension.dart';
import 'package:flutter/material.dart';

ThemeData themeDark(){

  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions:<ThemeExtension<dynamic>>[MyColors.dark,MyAssets.dark] ,
    useMaterial3: true,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: ColorsDark.white,
        fontFamily:FontFamilyHelper.getLocalizationFontFamily()
      )
    )
  );
}
ThemeData themeLight(){

  return ThemeData(
      scaffoldBackgroundColor: ColorsLight.mainColor,
      extensions:<ThemeExtension<dynamic>>[MyColors.light,MyAssets.light] ,
      useMaterial3: true
  );
}