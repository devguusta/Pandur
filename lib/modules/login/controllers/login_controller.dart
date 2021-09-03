// import 'dart:convert';

// import 'package:get_it/get_it.dart';
// import 'package:pandur/modules/login/repositories/login_repository.dart';
// import 'package:pandur/shared/models/user_model.dart';
// import 'package:pandur/shared/services/user_manager.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginController {
//   LoginRepository repository = LoginRepository();
//   SharedPreferences? _preferences;
//   Future<UserModel?> login(
//       {required String email, required String password}) async {
//     UserModel user;
//     try {
//       user = await repository.login(email: email, password: password);
//       GetIt.I<UserManager>().setUser(user);
//       _preferences = await SharedPreferences.getInstance();
//       await _preferences!.setString('user', json.encode(user.toJson()));
//       return user;
//     } catch (e) {
//       print("Login E: $e");
//       return null;
//     }
//   }

//   Future<bool> containsEmail({required String email}) async {
//     return await repository.containsEmail(email);
//   }

//   Future<bool> createAccount(
//       {required String email,
//       required String password,
//       required name,
//       required cpf}) async {
//          try {
//       UserModel? userModel = await repository.createAccount(
//           email: email, password: password, name: name,  cpf: cpf);

//       if (userModel != null) {
//         GetIt.I<UserManager>().setUser(userModel);
//         _preferences = await SharedPreferences.getInstance();
//         await _preferences!.setString('user', json.encode(userModel.toJson()));
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       print("Cadastro E: $e");
//       throw e;
//     }
//   }

//   Future updateUser(UserModel user) async {
//     try {
//       await repository.updateUser(user);
//     } catch (e) {
//       throw e;
//     }
//   }
// }