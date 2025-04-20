import 'package:feroo_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:feroo_store/core/app/upload_image/data_source/upload_image_data_source.dart';
import 'package:feroo_store/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:feroo_store/features/auth/data/reposatories/auth_repo.dart';
import 'package:feroo_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/data_source/auth_data_source.dart';
import '../app/app_cubit/app_cubit.dart';
import '../serves/qraphQL/api/api_service.dart';
import '../serves/qraphQL/api/dio_dactory.dart';


final sl = GetIt.instance ;

Future<void> InitInject()async{
 await _initCore() ;
 await _initAuth();


}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();

  sl
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton<ApiService>(() => ApiService(dio))
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey);

}
Future<void> _initAuth() async {
  

  sl
    ..registerFactory(()=>AuthBloc(sl()))
    ..registerLazySingleton<AuthRepos>(() => AuthRepos(sl()))
    ..registerLazySingleton<AuthDataSource>(() => AuthDataSource(sl()));

  sl.registerFactory(()=>UploadImageCubit(sl()));
  sl.registerLazySingleton<UploadImageRepo>(() => UploadImageRepo(sl())) ;
  sl.registerLazySingleton<UploadImageDataSource>(() => UploadImageDataSource(sl()));

}