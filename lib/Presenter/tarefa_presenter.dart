import 'package:app_todo/Model/Api/apiListagemTodo.dart';
import 'package:app_todo/Model/Model_Geral.dart';
import 'package:flutter/material.dart';

class TarefaPresenter extends ChangeNotifier {
  final TodoApi api;

  ListagemTodo? todo;

  TarefaPresenter(this.api);

  void obterLogin() async {
    todo = await api.listTodo();

    notifyListeners();
  }
}
