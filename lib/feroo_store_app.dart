import 'package:feroo_store/core/app/app_cubit/app_cubit.dart';
import 'package:feroo_store/core/app/connectivity_network_controller.dart';
import 'package:feroo_store/core/app/env.variabels.dart';
import 'package:feroo_store/core/app/languages/app_localizations.dart';
import 'package:feroo_store/core/app/languages/app_localizations_setup.dart';
import 'package:feroo_store/core/common/screans/no_network_screan.dart';
import 'package:feroo_store/routes/app_route.dart';
import 'package:feroo_store/core/style/font/font_size.dart';
import 'package:feroo_store/core/style/theme/theme_dark_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/style/font/font_family_helper.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
   return ValueListenableBuilder(
        valueListenable: ConnectivityNetworkController.instance.isConnect,
        builder: (_,value,__){
          if(value){
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            child: BlocBuilder<AppCubit,AppState>(
              builder: (context, state) {
                final cubit = context.read<AppCubit>();
                return MaterialApp(
                  locale:cubit.locale,
                  supportedLocales: AppLocalizationsSetup.supportedLocales,
                  localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
                  localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
                  theme:cubit.isDark?themeDark(cubit.locale):themeLight(cubit.locale),
                  debugShowCheckedModeBanner: EnvVariabels.instance.debugMode,
                  title: 'Feroo_Store',
                  onGenerateRoute:AppRoute.onGenerateRoute,
                  initialRoute: AppRoute.login,
                  builder: (context,widget){
                    ConnectivityNetworkController.instance.init();
                    return GestureDetector(
                      onTap: (){
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Scaffold(
                        body: Builder(
                          builder:(context){
                            return widget! ;
                          },
                        ),
                      ),
                    );
                  },
                );
              },

          ));
          }
          else {
            return MaterialApp(
                debugShowCheckedModeBanner: EnvVariabels.instance.debugMode,
                title: 'No_Inernet',
                home: NoNetworkScrean()
            );
          }
        },
   );
  }
}
