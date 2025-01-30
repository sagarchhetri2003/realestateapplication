// part of 'signup_bloc.dart';

// abstract class SignupEvent extends Equatable {
//   const SignupEvent();

//   @override
//   List<Object?> get props => [];
// }

// class NavigateToLoginScreenEvent extends SignupEvent {
//   final BuildContext context;
//   final Widget destination;

//   const NavigateToLoginScreenEvent({
//     required this.context,
//     required this.destination,
//   });

//   @override
//   List<Object?> get props => [context, destination];
// }

import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupButtonPressed extends SignupEvent {
  final String fullName;
  final String phone;
  final String address;
  final String email;
  final String password;
  final String confirmPassword;
  final File? profileImage;

  SignupButtonPressed({
    required this.fullName,
    required this.phone,
    required this.address,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.profileImage,
  });

  @override
  List<Object?> get props => [
        fullName,
        phone,
        address,
        email,
        password,
        confirmPassword,
        profileImage
      ];
}
