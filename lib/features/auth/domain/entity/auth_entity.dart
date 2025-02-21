import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String fullName;
  final String phonenumber;
  final String address;
  final String email;
  final String password;
  final image;

  const AuthEntity({
    this.userId,
    required this.fullName,
    required this.phonenumber,
    required this.address,
    required this.email,
    required this.password,
    this.image,
  });

  @override
  List<Object?> get props => [userId, fullName, email, password, image];
}
