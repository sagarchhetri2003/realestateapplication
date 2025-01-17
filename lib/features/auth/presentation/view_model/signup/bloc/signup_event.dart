// // import 'package:equatable/equatable.dart';

// // import 'package:equatable/equatable.dart';

// // abstract class SignUpEvent extends Equatable {
// //   @override
// //   List<Object?> get props => [];
// // }

// // class SignUpSubmittedEvent extends SignUpEvent {
// //   final String fullName;
// //   final String email;
// //   final String password;

// //   SignUpSubmittedEvent({
// //     required this.fullName,
// //     required this.email,
// //     required this.password,
// //   });

// //   @override
// //   List<Object?> get props => [fullName, email, password];
// // }

// import 'package:equatable/equatable.dart';

// abstract class SignUpEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class SignUpSubmittedEvent extends SignUpEvent {
//   final String fullName;
//   final String email;
//   final String password;

//   SignUpSubmittedEvent({
//     required this.fullName,
//     required this.email,
//     required this.password,
//   });

//   @override
//   List<Object?> get props => [fullName, email, password];
// }

part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

class NavigateToLoginScreenEvent extends SignupEvent {
  final BuildContext context;
  final Widget destination;

  const NavigateToLoginScreenEvent({
    required this.context,
    required this.destination,
  });

  @override
  List<Object?> get props => [context, destination];
}
