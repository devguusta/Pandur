// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$loadingAtom = Atom(name: '_LoginStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginStoreBase.login');

  @override
  Future<UserModel?> login({required String email, required String password}) {
    return _$loginAsyncAction
        .run(() => super.login(email: email, password: password));
  }

  final _$createAccountAsyncAction =
      AsyncAction('_LoginStoreBase.createAccount');

  @override
  Future<bool> createAccount(
      {required String email,
      required String password,
      required dynamic name,
      required dynamic cpf}) {
    return _$createAccountAsyncAction.run(() => super
        .createAccount(email: email, password: password, name: name, cpf: cpf));
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
