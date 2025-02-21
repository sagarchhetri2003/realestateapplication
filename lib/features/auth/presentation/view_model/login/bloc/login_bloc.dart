import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestateapplication/features/auth/presentation/view_model/signup/bloc/signup_bloc.dart';

import '../../../../domain/use_case/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase _loginUseCase;

  LoginBloc({
    required SignupBloc signupBloc,
    required LoginUsecase loginUseCase,
  })  : _loginUseCase = loginUseCase,
        super(LoginState.initial()) {
    // Handle login event
    on<LoginUserEvent>(_onLoginEvent);

    // Handle navigation to the Register screen
    on<NavigateSignupScreenEvent>((event, emit) {
      _handleNavigationToSignupScreen(event);
    });

    // Handle navigation to the Home screen
    on<NavigateHomeScreenEvent>((event, emit) {
      _handleNavigationToHomeScreen(event);
    });
  }

  Future<void> _onLoginEvent(
      LoginUserEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));

    final params =
        LoginUserParams(email: event.email, password: event.password);

    final result = await _loginUseCase.call(params);

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, isSuccess: false));
      },
      (success) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      },
    );
  }

  void _handleNavigationToSignupScreen(NavigateSignupScreenEvent event) {
    Navigator.push(
      event.context,
      MaterialPageRoute(
        builder: (context) => event.destination,
      ),
    );
  }

  // Handle navigation to Home screen
  void _handleNavigationToHomeScreen(NavigateHomeScreenEvent event) {
    Navigator.push(
      event.context,
      MaterialPageRoute(
        builder: (context) => event.destination,
      ),
    );
  }
}
