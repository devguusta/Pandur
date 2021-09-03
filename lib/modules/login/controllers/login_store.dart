import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:pandur/modules/login/repositories/login_repository.dart';
import 'package:pandur/shared/models/user_model.dart';
import 'package:pandur/shared/services/user_manager.dart';
import 'package:pandur/utils/errors/firebase_errors.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  
  LoginRepository repository = LoginRepository();
  SharedPreferences? _preferences;
  @observable
  bool loading = false;

  @action
   Future<UserModel?> login(
      {required String email, required String password}) async {
    UserModel user;
    try {
      loading = true;
      user = await repository.login(email: email, password: password);
      GetIt.I<UserManager>().setUser(user);
      _preferences = await SharedPreferences.getInstance();
      await _preferences!.setString('user', json.encode(user.toJson()));
      return user;
    } on FirebaseAuthException catch (e){
      final errorMessage = FireBaseErrors.verifyErroCode(e.code);
    }
    loading = false;
  }
  
  Future<bool> containsEmail({required String email}) async {
    return await repository.containsEmail(email);
  }
  @action
  Future<bool> createAccount(
      {required String email,
      required String password,
      required name,
      required cpf}) async {
         try {
           loading = true;
      UserModel? userModel = await repository.createAccount(
          email: email, password: password, name: name,  cpf: cpf);

      if (userModel != null) {
        GetIt.I<UserManager>().setUser(userModel);
        _preferences = await SharedPreferences.getInstance();
        await _preferences!.setString('user', json.encode(userModel.toJson()));
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Cadastro E: $e");
      throw e;
    }
    loading = false;
  }

  Future updateUser(UserModel user) async {
    try {
      loading = true;
      await repository.updateUser(user);
    } catch (e) {
      throw e;
    }
    loading = false;
  }



}