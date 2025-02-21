// import 'package:realestateapplication/core/network/hive_service.dart';
// import 'package:realestateapplication/features/auth/data/datasource/auth_data_source.dart';
// import 'package:realestateapplication/features/auth/domain/entity/auth_entity.dart';

// import '../../model/auth_hive_model.dart';

// class AuthLocalDataSource implements IAuthDataSource {
//   final HiveService _hiveService;

//   AuthLocalDataSource(this._hiveService);

//   @override
//   Future<AuthEntity> getCurrentUser() {
//     // Return Empty AuthEntity
//     return Future.value(const AuthEntity(
//       userId: "1",
//       fullname: "",
//       email: "",
//       password: "",
//     ));
//   }

//   @override
//   Future<String> loginUser(String email, String password) async {
//     try {
//       final user = await _hiveService.login(email, password);
//       return Future.value("Login successful");
//     } catch (e) {
//       return Future.error(e);
//     }
//   }

//   @override
//   Future<void> registerUser(AuthEntity user) async {
//     try {
//       // Convert AuthEntity to AuthHiveModel
//       final authHiveModel = AuthHiveModel.fromEntity(user);

//       await _hiveService.register(authHiveModel);
//       return Future.value();
//     } catch (e) {
//       return Future.error(e);
//     }
//   }
// }

import 'package:realestateapplication/features/auth/data/datasource/auth_data_source.dart';
import 'package:realestateapplication/features/auth/domain/entity/auth_entity.dart';

import '../../../../../core/network/hive_service.dart';
import '../../model/auth_hive_model.dart';

class AuthLocalDataSource implements IAuthDataSource {
  final HiveService _hiveService;

  AuthLocalDataSource(this._hiveService);

  @override
  Future<AuthEntity> getCurrentUser() {
    // Return Empty AuthEntity
    return Future.value(const AuthEntity(
      userId: "1",
      fullName: "",
      phonenumber: "",
      address: "",
      email: "",
      password: "",
      image: null,
    ));
  }

  @override
  Future<String> loginUser(String email, String password) async {
    try {
      final user = await _hiveService.login(email, password);
      return Future.value("Login successful");
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> registerUser(AuthEntity user) async {
    try {
      // Convert AuthEntity to AuthHiveModel
      final authHiveModel = AuthHiveModel.fromEntity(user);

      await _hiveService.register(authHiveModel);
      return Future.value();
    } catch (e) {
      return Future.error(e);
    }
  }
}
