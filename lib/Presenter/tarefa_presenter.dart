import 'package:app_todo/Model/Api/apiListagemTodo.dart';
import 'package:app_todo/Model/apitodo.dart';
import 'package:flutter/material.dart';

class TarefaPresenter extends ChangeNotifier {
  final api = TodoApi();

  ListagemTodo? todo;

  void obterLogin() async {
    todo = await api.listTodo();

    notifyListeners();
  }
}
