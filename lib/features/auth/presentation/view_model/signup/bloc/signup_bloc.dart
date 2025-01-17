// // import 'package:bloc/bloc.dart';
// // import 'package:equatable/equatable.dart';
// // import 'package:realestateapplication/features/auth/presentation/view_model/signup/bloc/signup_event.dart';
// // import 'package:realestateapplication/features/auth/presentation/view_model/signup/bloc/signup_state.dart';

// // // import 'package:realestateapplication/auth/presentation/view_model/signup/bloc/signup_state.dart';
// // // import 'package:realestateapplication/features/auth/presentation/view_model/signup/bloc/signup_event.dart';
// // // import 'package:realestateapplication/features/auth/presentation/view_model/signup/bloc/signup_state.dart';

// // import '../../../../../batch/presentation/view_model/batch_bloc.dart';

// // part 'signup_event.dart';
// // part 'signup_state.dart';

// // class SignupBloc extends Bloc<SignupEvent, SignupState> {
// //   final BatchBloc _batchBloc;
// //   final CourseBloc _courseBloc;

// //   SignupBloc({
// //     required BatchBloc batchBloc,
// //     required CourseBloc courseBloc,
// //   })  : _batchBloc = batchBloc,
// //         _courseBloc = courseBloc,
// //         super(SignupState.initial()) {
// //     on<LoadCoursesAndBatches>(_onRegisterEvent);

// //     add(LoadCoursesAndBatches());
// //   }

// //   void _onRegisterEvent(
// //     LoadCoursesAndBatches event,
// //     Emitter<SignupState> emit,
// //   ) {
// //     emit(state.copyWith(isLoading: true));
// //     _batchBloc.add(LoadBatches());
// //     _courseBloc.add(CourseLoad());
// //     emit(state.copyWith(isLoading: false, isSuccess: true));
// //   }
// // }

// import 'package:bloc/bloc.dart';
// import 'package:realestateapplication/features/auth/domain/use_case/signup_usecase.dart';
// import 'package:realestateapplication/features/auth/presentation/view_model/signup/bloc/signup_event.dart';
// import 'package:realestateapplication/features/auth/presentation/view_model/signup/bloc/signup_state.dart';

// class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
//   SignUpBloc({required RegisterUseCase registerUseCase}) : super(SignUpInitialState()) {
//     on<SignUpSubmittedEvent>((event, emit) async {
//   emit(SignUpLoadingState());

//   try {
//     final result = await registerUseCase.call(
//       RegisterUserParams(email: event.email, password: event.password),
//     );

//     result.fold(
//       (failure) => emit(SignUpErrorState(errorMessage: failure.message)),
//       (_) => emit(SignUpSuccessState()),
//     );
//   } catch (e) {
//     emit(SignUpErrorState(errorMessage: "Something went wrong"));
//   }
// });

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState.initial()) {
    on<NavigateToLoginScreenEvent>(_onNavigateToLoginScreenEvent);
  }

  void _onNavigateToLoginScreenEvent(
    NavigateToLoginScreenEvent event,
    Emitter<SignupState> emit,
  ) {
    // Perform navigation using Navigator.push
    Navigator.push(
      event.context,
      MaterialPageRoute(builder: (context) => event.destination),
    );

    // Optionally, emit a new state if needed
    // emit(NavigateToLoginScreenState());
  }
}
