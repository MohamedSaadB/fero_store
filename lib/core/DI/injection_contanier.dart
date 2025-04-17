import 'package:feroo_store/core/app/app_cubit/app_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initInject() async {
  await _initCore();
}

Future<void> _initCore() async {
  sl.registerFactory(() => AppCubit());
}
