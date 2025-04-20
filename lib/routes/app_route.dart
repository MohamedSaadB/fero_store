import 'package:feroo_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:feroo_store/core/common/screans/under_build_screen.dart';
import 'package:feroo_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:feroo_store/features/auth/presentation/screens/login_screen.dart';
import 'package:feroo_store/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:feroo_store/routes/base_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/DI/injection_container.dart';

class AppRoute {

  static const String login = "login";
  static const String signUp = "signUp";


  static  Route<dynamic>? onGenerateRoute(RouteSettings setting){

    final arg = setting.arguments;
    switch(setting.name){
      case login:
        return BaseRoute(page:
        BlocProvider( create:(_)=> sl<AuthBloc>(),child: LogIn(),),);
      case signUp:
        return BaseRoute(page:
        MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (_) => sl<AuthBloc>(),
            ),
            BlocProvider<UploadImageCubit>(
              create: (_) => sl<UploadImageCubit>(),
            ),
          ],
          child: SignUp(),
        ),);
      default : return BaseRoute(page:PageUnderBuildScreen());
    }
  }

}