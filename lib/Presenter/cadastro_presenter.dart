import 'package:app_todo/Model/Api/apiCadastroDeUsuario.dart';
import 'package:app_todo/Model/Api/apiLoginDeUsuario.dart';
import 'package:app_todo/Model/Model_Geral.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CadastroDeUsuario2 extends ChangeNotifier {
  final api = TodoApi();

  LoginDeUsuario? logins;
  bool carregar = false;

  void obterLogin(String email, String senha, String nome, VoidCallback sucesso,
      VoidCallback falhou) {
    api.register(email, senha, nome).then((value) async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('jwt', '${value?.jwt}');
      sucesso();
    }).onError((erro, _) {
      falhou();
    });
  }

  Future<bool> verificacaoToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('jwt') != null) {
      return true;
    } else {
      return false;
    }
  }
}
