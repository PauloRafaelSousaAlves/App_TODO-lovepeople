import 'package:app_todo/Model/Api/apiLoginDeUsuario.dart';
import 'package:app_todo/Model/Model_Geral.dart';
import 'package:flutter/material.dart';

class LoginPresenter extends ChangeNotifier {
  final TodoApi api;

  LoginDeUsuario? logins;
  bool carregar = false;

  LoginPresenter(this.api);

  void obterLogin(
      String email, String senha, VoidCallback sucesso, VoidCallback falhou) {
    carregamento(true);
    api.login(email, senha).then((value) {
      if (value != null) {
      } else {
        falhou.call();
      }
    }).catchError((error) {
      falhou.call();
    }).whenComplete(() {
      carregamento(false);
    });
  }

  void carregamento(bool correto) {
    postFrame(() {
      carregar = correto;
      notifyListeners();
    });
  }

  void verificacaoToken(VoidCallback autenticacao) {
    carregamento(true);
    api.getLogin().then((value) {
      if (value != null) {
        autenticacao();
      }
    }).whenComplete(() {
      carregamento(false);
    });
  }
}

void postFrame(Function execute) {
  Future.delayed(Duration.zero, () {
    execute();
  });
}
