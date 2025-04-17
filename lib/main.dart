import 'package:feroo_store/core/app/app_cubit/app_cubit.dart';
import 'package:feroo_store/core/app/bloc_observer.dart';
import 'package:feroo_store/core/app/env.variabels.dart';
import 'package:feroo_store/core/serves/shared_pref/pref_key.dart';
import 'package:feroo_store/core/serves/shared_pref/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/DI/injection_contanier.dart';
import 'feroo_store_app.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVariabels.instance.init(envType: envTypeEnum.dev);
  await Firebase.initializeApp(
      options:
      const FirebaseOptions(
          apiKey: 'AIzaSyA9a-bjuxLRAGvdmPCOT7Qg8t3O3-raqOs',
          appId:'1:587995618710:android:9a93bdb2f1ac79192251b7',
          messagingSenderId:'587995618710',
          projectId: 'feroo-store',
      ),
  );
  await SharedPref().instantiatePreferences();

  await initInject();

  Bloc.observer = AppBlocObserver();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,DeviceOrientation.portraitUp,
  ]).then((_){
    runApp( BlocProvider(
      create: (_) => sl<AppCubit>()
        ..changeThemeMode(shrePref: SharedPref().getBoolean(PrefKey.ThemMode))
        ..changeLang(sharedCodeLang: SharedPref().getString(PrefKey.LangKey)),
      child: const MyApp(),
    ),
    );
  });
}



