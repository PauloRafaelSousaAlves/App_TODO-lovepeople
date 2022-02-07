import 'package:app_todo/Model/Api/apiCadastroDeUsuario.dart';
import 'package:app_todo/Model/Model_Geral.dart';
import 'package:flutter/cupertino.dart';

class CadastroDeUsuario extends ChangeNotifier {
  final TodoApi api;

  CadastroDeUsuario? logins;
  bool carregar = false;

  CadastroDeUsuario(this.api);

  void obterLogin(String nome, String email, String senha, VoidCallback sucesso,
      VoidCallback falhou) {
    carregamento(true);
    api.register(nome, email, senha).then((value) {
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
      carregar = true;
      notifyListeners();
    });
  }

  void postFrame(Function execute) {
    Future.delayed(Duration.zero, () {
      execute();
    });
  }
}
