import 'package:food_hub/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthDataSource {
  Future<String> loginUser(String email, String password);

  Future<String> registerUser(AuthEntity user);
}
