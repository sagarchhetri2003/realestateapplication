// // part of 'register_bloc.dart';

// // class SignupState {
// //   final bool isLoading;
// //   final bool isSuccess;

// //   SignupState({
// //     required this.isLoading,
// //     required this.isSuccess,
// //   });

// //   SignupState.initial()
// //       : isLoading = false,
// //         isSuccess = false;

// //   SignupState copyWith({
// //     bool? isLoading,
// //     bool? isSuccess,
// //   }) {
// //     return SignupState(
// //       isLoading: isLoading ?? this.isLoading,
// //       isSuccess: isSuccess ?? this.isSuccess,
// //     );
// //   }
// // }

// import 'package:equatable/equatable.dart';

// abstract class SignUpState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class SignUpInitialState extends SignUpState {}

// class SignUpLoadingState extends SignUpState {}

// class SignUpSuccessState extends SignUpState {}

// class SignUpErrorState extends SignUpState {
//   final String errorMessage;

//   SignUpErrorState({required this.errorMessage});

//   @override
//   List<Object?> get props => [errorMessage];
// }

part of 'signup_bloc.dart';

class SignupState {
  final bool isLoading;
  final bool isSuccess;

  SignupState({
    required this.isLoading,
    required this.isSuccess,
  });

  SignupState.initial()
      : isLoading = false,
        isSuccess = false;

  SignupState copyWith({
    bool? isLoading,
    bool? isSuccess,
  }) {
    return SignupState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
