
import 'dart:ui';

import 'package:feroo_store/core/serves/shared_pref/pref_key.dart';
import 'package:feroo_store/core/serves/shared_pref/shared_pref.dart';

class FontFamilyHelper{

  static const String arabic_cairo = 'cairo' ;
  static const String english_poppins = 'poppins' ;

  static String getLocalizationFontFamily(Locale getLocalization ){


    switch(getLocalization.languageCode){
      case "en" :
        return english_poppins ;
      case "ar":
        return arabic_cairo ;
      default:return english_poppins ;
    }

  }

}