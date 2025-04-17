import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:feroo_store/core/serves/shared_pref/pref_key.dart';
import 'package:feroo_store/core/serves/shared_pref/shared_pref.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());


  bool isDark = true ;
  //Theme Mode
  Future<void> changeThemeMode({required bool? shrePref}) async{
    if(shrePref != null){
      isDark = shrePref ;
      emit(AppState.themeChangeMode(isDark: isDark));
    }else{
      isDark = !isDark ;
      await SharedPref().setBoolean(PrefKey.ThemMode, isDark);
      emit(AppState.themeChangeMode(isDark: isDark));
    }

  }

  Locale locale = Locale("en");
  // Change Languages
 Future<void> changeLang({required String? sharedCodeLang}) async{
    if(sharedCodeLang !=null){
      if(sharedCodeLang == 'en'){
        locale = Locale('en');
      }
      else{
        locale = Locale('ar');
      }
     emit(AppState.changeLanguages(locale: this.locale));
    }else{
     if(locale.languageCode == 'en'){
       locale = Locale('ar');
       SharedPref().setString(PrefKey.LangKey, locale.languageCode);
     }else{
       locale = Locale('en');
       SharedPref().setString(PrefKey.LangKey, locale.languageCode);
     }
     emit(AppState.changeLanguages(locale: locale));
    }
 }
}
