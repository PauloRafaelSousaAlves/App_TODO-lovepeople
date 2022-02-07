import 'package:app_todo/Model/Api/apiCadastroTodo.dart';
import 'package:app_todo/Model/Model_Geral.dart';
import 'package:flutter/material.dart';

class NovaTarefaPresenter extends ChangeNotifier {
  final TodoApi api;

  NovaTarefaPresenter(this.api);

  void novaTarefa(
      CadastroTodo todo, VoidCallback sucesso, VoidCallback falhou) {
    api.registersTodo('titulo', 'descricao', 'cor').then((value) {
      if (value != null) {
        sucesso.call();
      } else {
        falhou.call();
      }
    });
  }
}
