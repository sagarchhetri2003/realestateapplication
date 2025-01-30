import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String fullname;
  final String phonenumber;
  final String address;
  final String email;
  final String password;

  const AuthEntity({
    this.userId,
    required this.fullname,
    required this.phonenumber,
    required this.address,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [userId, fullname, email, password];
}
