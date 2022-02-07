import 'package:app_todo/Model/Api/apiCadastroTodo.dart';
import 'package:app_todo/Model/apitodo.dart';
import 'package:flutter/material.dart';

class NovaTarefaPresenter extends ChangeNotifier {
  final api = TodoApi();

  CadastroTodo? cadastroTodo;

  void obterLogin() async {
    cadastroTodo = await api.registersTodo('titulo', 'descricao', 'cor');

    notifyListeners();
  }
}
