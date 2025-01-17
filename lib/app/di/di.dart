// import 'package:get_it/get_it.dart';
// import '../../core/network/hive_service.dart';
// import '../../features/auth/presentation/view_model/login/bloc/login_bloc.dart';
// import '../../features/auth/presentation/view_model/signup/bloc/signup_bloc.dart';
// import '../../features/splash/presentation/view_model/splash_cubit.dart';

// final getIt = GetIt.instance;

// Future<void> initDependencies() async {
//   await _initHiveService();
//   await _initSignupDependencies();
//   await _initLoginDependencies();
//   await _initSplashDependencies();
// }

// _initHiveService() {
//   getIt.registerLazySingleton<HiveService>(() => HiveService());
// }

// _initSignupDependencies() async {
//   getIt.registerFactory<SignupBloc>(
//     () => SignupBloc(),
//   );
// }

// _initLoginDependencies() async {
//   getIt.registerFactory<LoginBloc>(
//     () => LoginBloc(
//       signupBloc: getIt<SignupBloc>(),
//     ),
//   );
// }

// _initSplashDependencies() async {
//   getIt.registerFactory<SplashCubit>(
//     () => SplashCubit(getIt<SignupBloc>()),
//   );
// }

import 'package:get_it/get_it.dart';
import 'package:realestateapplication/core/network/hive_service.dart';
import 'package:realestateapplication/features/auth/presentation/view_model/login/bloc/login_bloc.dart';
import 'package:realestateapplication/features/auth/presentation/view_model/signup/bloc/signup_bloc.dart';

import '../../features/splash/presentation/view_model/splash_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveService();
  await _initSignupDependencies();
  await _initLoginDependencies();
  await _initSplashDependencies();
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initSignupDependencies() async {
  getIt.registerFactory<SignupBloc>(
    () => SignupBloc(),
  );
}

_initLoginDependencies() async {
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      signupBloc: getIt<SignupBloc>(),
    ),
  );
}

_initSplashDependencies() async {
  getIt.registerFactory<SplashCubit>(() => SplashCubit(getIt<LoginBloc>()));
}
