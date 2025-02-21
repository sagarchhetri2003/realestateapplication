import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:realestateapplication/app/shared_prefs/token_shared_prefs.dart';
import 'package:realestateapplication/features/auth/domain/use_case/login_use_case.dart';
import 'package:realestateapplication/features/auth/presentation/view_model/signup/bloc/signup_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/network/api_service.dart';
import '../../core/network/hive_service.dart';
import '../../features/auth/data/datasource/local_data_source/local_data_source.dart';
import '../../features/auth/data/datasource/remote_data_source/remote_data_source.dart';
import '../../features/auth/data/repository/auth_local_repository.dart';
import '../../features/auth/data/repository/auth_remote_repository.dart';
import '../../features/auth/domain/use_case/signup_usecase.dart';
import '../../features/auth/domain/use_case/upload_image_usecase.dart';
import '../../features/auth/presentation/view_model/login/bloc/login_bloc.dart';
import '../../features/splash/presentation/view_model/splash_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveService();
  await _initApiService();
  await _sharedpreferences();
  await _initSplashDependencies();
  await _initLoginDependencies();
  await _initSignupDependencies();
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initApiService() {
  //remote data souce
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

Future<void> _sharedpreferences() async {
  final sharedPreferencesInstance = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(
      () => sharedPreferencesInstance);
}

_initSplashDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<SignupBloc>()),
  );
}

_initLoginDependencies() async {
  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(
      authRepository: getIt<AuthRemoteRepository>(),
      tokenSharedPrefs: getIt<TokenSharedPrefs>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      signupBloc: getIt<SignupBloc>(),
      loginUseCase: getIt<LoginUsecase>(),
    ),
  );
}

_initSignupDependencies() async {
  getIt.registerLazySingleton(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  // init local repository
  // getIt.registerLazySingleton(
  //   () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  // );

  //Remote data source
  getIt.registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(getIt<Dio>()));

  //local Remotre
  getIt.registerLazySingleton<AuthLocalRepository>(
      () => AuthLocalRepository(getIt<AuthLocalDataSource>()));

  //Repo Remotre
  getIt.registerLazySingleton<AuthRemoteRepository>(
      () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()));

  // register use usecase
  getIt.registerLazySingleton<SignupUsecase>(
    () => SignupUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  // Upload image use case
  getIt.registerLazySingleton<UploadImageUsecase>(
    () => UploadImageUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerFactory<SignupBloc>(
    () => SignupBloc(
      signupUseCase: getIt(),
      uploadImageUseCase: getIt(),
    ),
  );

  // getIt.registerFactory<SignupBloc>(
  //   () => SignupBloc(
  //     loginBloc: getIt<LoginBloc>(),
  //     registerUseCase: getIt(),
  //   ),
  // );
}

// _initLoginDependencies() async {
//   if (!getIt.isRegistered<LoginUseCase>()) {
//     getIt.registerLazySingleton<LoginUseCase>(
//         () => LoginUseCase(authRepository: getIt<AuthRemoteRepository>()));
//   }
//   getIt.registerFactory<LoginBloc>(
//     () => LoginBloc(
//       signupBloc: getIt<SignupBloc>(),
//       loginUseCase: getIt<LoginUseCase>(),
//     ),
//   );
// }
