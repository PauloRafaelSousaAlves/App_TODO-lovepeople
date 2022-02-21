import 'package:app_todo/Model/Api/apiDeleteTodo.dart';
import 'package:app_todo/Model/Api/apiListagemTodo.dart';
import 'package:app_todo/Model/Model_Geral.dart';
import 'package:flutter/material.dart';

class TarefaPresenter extends ChangeNotifier {
  final api = TodoApi();

  List<ListagemTodo> tarefas = [];
  List<ListagemTodo> _filterTodos = [];

  void obterListTarefas() {
    api.listaTarefas().then((value) {
      tarefas = value;
      _filterTodos = value;
      notifyListeners();
    }).onError((error, _) {});
  }

  final del = DeleteItem();

  void DeletarTodo(ListagemTodo tasklist) {
    del.deletarTodo(tasklist.id).then((response) {
      if (response != null) {
        tarefas.remove(tasklist);
      }
    });
    notifyListeners();
  }

  void filters(String filter) {
    tarefas = _filterTodos
        .where((element) =>
            element.title!.toLowerCase().contains(filter.toLowerCase()) ||
            element.description!.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
