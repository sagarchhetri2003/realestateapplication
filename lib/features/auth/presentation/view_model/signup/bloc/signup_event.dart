// // import 'package:equatable/equatable.dart';

// // abstract class SignupEvent extends Equatable {
// //   @override
// //   List<Object?> get props => [];
// // }

// // class SignupButtonPressed extends SignupEvent {
// //   final String fullName;
// //   final String phone;
// //   final String address;
// //   final String email;
// //   final String password;
// //   final String confirmPassword;
// //   // final File? profileImage;

// //   SignupButtonPressed({
// //     required this.fullName,
// //     required this.phone,
// //     required this.address,
// //     required this.email,
// //     required this.password,
// //     required this.confirmPassword,
// //     // this.profileImage,
// //   });

// //   @override
// //   List<Object?> get props => [
// //         fullName,
// //         phone,
// //         address,
// //         email,
// //         password,
// //         confirmPassword,
// //         // profileImage
// //       ];
// // }

// import 'dart:io';

// import 'package:equatable/equatable.dart';
// part of "signup_bloc.dart";

// sealed class SignupEvent extends Equatable {
//   RegisterEvent();

//   @override
//   List<Object> get props => [];
// }

// class LoadImage extends SignupEvent {
//   final File file;

//   LoadImage({
//     required this.file,
//   });

//   @override
//   RegisterEvent() {
//     // TODO: implement RegisterEvent
//     throw UnimplementedError();
//   }
// }

// class SignupUser extends SignupEvent {
//   final BuildContext context;
//   final String email;
//   final String fullName;
//   final String phonenumber;
//   final String address;
//   final String? image;
//   final String password;

//   const SignupUser({
//     required this.context,
//     required this.email,
//     required this.fullName,
//     required this.phonenumber,
//     this.image,
//     required this.password,
//     required this.address,
//   });

//   @override
//   RegisterEvent() {
//     // TODO: implement RegisterEvent
//     throw UnimplementedError();
//   }
// }

// // class NavigateLoginScreenEvent extends SignupEvent {
// //   final BuildContext context;
// //   final Widget destination;

// //   const NavigateLoginScreenEvent({
// //     required this.context,
// //     required this.destination,
// //   });
// // }

part of "signup_bloc.dart";

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class LoadImage extends SignupEvent {
  final File file;

  const LoadImage({
    required this.file,
  });
}

class SignupUser extends SignupEvent {
  final BuildContext context;
  final String email;
  final String fullName;
  final String phonenumber;
  final String address;
  final String? image;
  final String password;

  const SignupUser({
    required this.context,
    required this.email,
    required this.fullName,
    required this.phonenumber,
    required this.address,
    this.image,
    required this.password,
  });
}

// class NavigateLoginScreenEvent extends SignupEvent {
//   final BuildContext context;
//   final Widget destination;

//   const NavigateLoginScreenEvent({
//     required this.context,
//     required this.destination,
//   });
// }
