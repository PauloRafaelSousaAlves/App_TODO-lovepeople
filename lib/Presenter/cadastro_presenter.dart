import 'package:app_todo/Model/Api/apiCadastroDeUsuario.dart';
import 'package:app_todo/Model/apitodo.dart';
import 'package:flutter/cupertino.dart';

class CadastroPresenter extends ChangeNotifier {
  final api = TodoApi();

  CadastroDeUsuario? cadastro;

  void cadastrar() async {
    cadastro = await api.register('email', 'nome', 'senha');

    notifyListeners();
  }
}
