import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestateapplication/features/auth/presentation/view_model/signup/bloc/signup_bloc.dart';

import '../../../auth/presentation/view/signup_page.dart';

class SplashCubit extends Cubit<void> {
  SplashCubit(this._signupBloc) : super(null);

  final SignupBloc _signupBloc;

  Future<void> init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), () async {
      // Open Login page or Onboarding Screen

      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: _signupBloc,
              child: SignupView(),
            ),
          ),
        );
      }
    });
  }
}
