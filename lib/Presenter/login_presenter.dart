import 'package:app_todo/Model/Api/apiLoginDeUsuario.dart';
import 'package:app_todo/Model/apitodo.dart';
import 'package:flutter/material.dart';

class LoginPresenter extends ChangeNotifier {
  final api = TodoApi();

  LoginDeUsuario? logins;

  void obterLogin() async {
    logins = await api.login('email', 'senha');

    notifyListeners();
  }
}
