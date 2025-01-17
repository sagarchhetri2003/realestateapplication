import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestateapplication/core/theme/app_theme.dart';
import 'package:realestateapplication/features/splash/presentation/view/splash_view.dart';
import 'package:realestateapplication/features/splash/presentation/view_model/splash_cubit.dart';

import 'di/di.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Student Management',
      theme: AppTheme.getApplicationTheme(isDarkMode: false),
      home: BlocProvider.value(
        value: getIt<SplashCubit>(),
        child: SplashScreenView(),
      ),
    );
  }
}
