import 'package:feroo_store/core/common/screans/under_build_screen.dart';
import 'package:feroo_store/features/auth/presentation/screens/login_screen.dart';
import 'package:feroo_store/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:feroo_store/routes/base_routes.dart';
import 'package:flutter/material.dart';

class AppRoute {

  static const String login = "login";
  static const String signUp = "signUp";


  static  Route<dynamic>? onGenerateRoute(RouteSettings setting){

    final arg = setting.arguments;
    switch(setting.name){
      case login:
        return BaseRoute(page:LogIn());
      case signUp:
        return BaseRoute(page:SignUp());
      default : return BaseRoute(page:PageUnderBuildScreen());
    }
  }

}