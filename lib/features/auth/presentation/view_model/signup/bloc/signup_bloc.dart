// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';

// part 'signup_event.dart';
// part 'signup_state.dart';

// class SignupBloc extends Bloc<SignupEvent, SignupState> {
//   SignupBloc() : super(SignupState.initial()) {
//     on<NavigateToLoginScreenEvent>(_onNavigateToLoginScreenEvent);
//   }

//   void _onNavigateToLoginScreenEvent(
//     NavigateToLoginScreenEvent event,
//     Emitter<SignupState> emit,
//   ) {
//     // Perform navigation using Navigator.push
//     Navigator.push(
//       event.context,
//       MaterialPageRoute(builder: (context) => event.destination),
//     );

//     // Optionally, emit a new state if needed
//     // emit(NavigateToLoginScreenState());
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupButtonPressed>(_onSignup);
  }

  Future<void> _onSignup(
      SignupButtonPressed event, Emitter<SignupState> emit) async {
    emit(SignupLoading());

    if (event.password != event.confirmPassword) {
      emit(SignupFailure("Passwords do not match."));
      return;
    }

    try {
      var userBox = await Hive.openBox('users');
      if (userBox.containsKey(event.email)) {
        emit(SignupFailure("Email is already registered."));
        return;
      }

      userBox.put(event.email, {
        "name": event.fullName,
        "phone": event.phone,
        "address": event.address,
        "email": event.email,
        "password": event.password,
        "profileImagePath": event.profileImage?.path ?? '',
      });

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_email', event.email);
      await prefs.setString('user_password', event.password);

      emit(SignupSuccess("Account created successfully!"));
    } catch (e) {
      emit(SignupFailure("An error occurred. Please try again."));
    }
  }
}
