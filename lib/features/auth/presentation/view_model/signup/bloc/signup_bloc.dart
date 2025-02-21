// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:hive_flutter/hive_flutter.dart';
// // import 'package:realestateapplication/features/auth/presentation/view_model/signup/bloc/signup_state.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // import 'signup_event.dart';

// // class SignupBloc extends Bloc<SignupEvent, SignupState> {
// //   SignupBloc() : super(SignupInitial()) {
// //     on<SignupButtonPressed>(_onSignup);
// //   }

// //   Future<void> _onSignup(
// //       SignupButtonPressed event, Emitter<SignupState> emit) async {
// //     emit(SignupLoading());

// //     if (event.password != event.confirmPassword) {
// //       emit(SignupFailure("Passwords do not match."));
// //       return;
// //     }

// //     try {
// //       var userBox = await Hive.openBox('users');
// //       if (userBox.containsKey(event.email)) {
// //         emit(SignupFailure("Email is already registered."));
// //         return;
// //       }

// //       userBox.put(event.email, {
// //         "name": event.fullName,
// //         "phone": event.phone,
// //         "address": event.address,
// //         "email": event.email,
// //         "password": event.password,
// //         // "profileImagePath": event.profileImage?.path ?? '',
// //       });

// //       final SharedPreferences prefs = await SharedPreferences.getInstance();
// //       await prefs.setString('user_email', event.email);
// //       await prefs.setString('user_password', event.password);

// //       emit(SignupSuccess("Account created successfully!"));
// //     } catch (e) {
// //       emit(SignupFailure("An error occurred. Please try again."));
// //     }
// //   }
// // }

// import 'dart:io';

// import 'package:equatable/equatable.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:realestateapplication/features/auth/domain/use_case/signup_usecase.dart';
// import 'package:realestateapplication/features/auth/domain/use_case/upload_image_usecase.dart';

// part 'signup_event.dart';
// part 'signup_state.dart';

// class SignupBloc extends Bloc<SignupEvent, SignupEvent> {
//   final SignupUsecase _signupUseCase;
//   // final LoginBloc _loginBloc;
//   final UploadImageUsecase _uploadImageUsecase;

//   SignupBloc({
//     // required LoginBloc loginBloc,
//     required SignupUsecase signupUseCase,
//     required UploadImageUsecase uploadImageUseCase,
//   })  : _signupUseCase = signupUseCase,
//         _uploadImageUsecase = uploadImageUseCase,

//         // _loginBloc = loginBloc,

//         super(SignupState.initial()) {
//     // on<NavigateLoginScreenEvent>((event, emit) {
//     //   Navigator.push(
//     //       event.context,
//     //       MaterialPageRoute(
//     //           builder: (context) => MultiBlocProvider(
//     //               providers: [BlocProvider.value(value: _loginBloc)],
//     //               child: event.destination)));
//     // });
//     on<SignupUser>(_onRegisterEvent);
//     on<LoadImage>(_onLoadImage);
//   }

//   void _onLoadImage(LoadImage event, Emitter<SignupState> emit) async {
//     emit(state.copyWith(isLoading: true));
//     final result = await _uploadImageUsecase.call(
//       UploadImageParams(
//         file: event.file,
//       ),
//     );

//     result.fold(
//       (l) => emit(state.copyWith(isLoading: false, isSuccess: false)),
//       (r) {
//         emit(state.copyWith(isLoading: false, isSuccess: true, imageName: r));
//       },
//     );
//   }

//   void _onRegisterEvent(
//     SignupUser event,
//     Emitter<SignupState> emit,
//   ) async {
//     emit(state.copyWith(isLoading: true));
//     final result = await _signupUseCase.call(RegisterUserParams(
//         fullname: event.fullName,
//         email: event.email,
//         phonenumber: event.phonenumber,
//         image: state.imageName,
//         password: event.password));

//     result.fold(
//       (l) => emit(state.copyWith(isLoading: false, isSuccess: false)),
//       (r) {
//         emit(state.copyWith(isLoading: false, isSuccess: true));
//       },
//     );
//   }
// }

import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestateapplication/core/common/snackbar/my_snackbar.dart';
import 'package:realestateapplication/features/auth/domain/use_case/signup_usecase.dart';
import 'package:realestateapplication/features/auth/domain/use_case/upload_image_usecase.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUsecase _signupUsecase;
  // final LoginBloc _loginBloc;
  final UploadImageUsecase _uploadImageUsecase;

  SignupBloc({
    // required LoginBloc loginBloc,
    required SignupUsecase signupUseCase,
    required UploadImageUsecase uploadImageUseCase,
  })  : _signupUsecase = signupUseCase,
        _uploadImageUsecase = uploadImageUseCase,

        // _loginBloc = loginBloc,

        super(SignupState.initial()) {
    // on<NavigateLoginScreenEvent>((event, emit) {
    //   Navigator.push(
    //       event.context,
    //       MaterialPageRoute(
    //           builder: (context) => MultiBlocProvider(
    //               providers: [BlocProvider.value(value: _loginBloc)],
    //               child: event.destination)));
    // });
    on<SignupUser>(_onSignupEvent);
    on<LoadImage>(_onLoadImage);
  }

  void _onLoadImage(LoadImage event, Emitter<SignupState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _uploadImageUsecase.call(
      UploadImageParams(
        file: event.file,
      ),
    );

    result.fold(
      (l) => emit(state.copyWith(isLoading: false, isSuccess: false)),
      (r) {
        emit(state.copyWith(isLoading: false, isSuccess: true, imageName: r));
      },
    );
  }

  void _onSignupEvent(
    SignupUser event,
    Emitter<SignupState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _signupUsecase.call(SignupUserParams(
        fullName: event.fullName,
        email: event.email,
        phonenumber: event.phonenumber,
        address: event.address,
        image: state.imageName,
        password: event.password));

    result.fold(
      (l) => emit(state.copyWith(isLoading: false, isSuccess: false)),
      (r) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        showMySnackBar(
            context: event.context, message: "Register Sucessfully ");
      },
    );
  }
}
