import 'dart:convert';
import 'package:app_todo/Model/Api/apiCadastroDeUsuario.dart';
import 'package:app_todo/Model/Api/apiCadastroTodo.dart';
import 'package:app_todo/Model/Api/apiDeleteTodo.dart';
import 'package:app_todo/Model/Api/apiListagemTodo.dart';
import 'package:app_todo/Model/Api/apiLoginDeUsuario.dart';
import 'package:app_todo/Presenter/sharedPreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart ' as http;

class TodoApi {
  final Preferences _Preferences;

  String token = '';

  bool isLoading = false;

  TodoApi(this._Preferences);

  get deleteTodo => null;

  Future<LoginDeUsuario?> login(String email, String senha) {
    final body = {
      'identifier': email,
      'password': senha,
    };
    var url = Uri.parse('https:todo-lovepeople.herokuapp.com/auth/local');

    return http.post(url, body: body).then((value) async {
      if (value.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(value.body);
        LoginDeUsuario resp = LoginDeUsuario.fromJson(json);
        token = resp.jwt!;
      } else {
        return null;
      }
    });
  }

  Future register(String email, String nome, String senha) async {
    var url =
        Uri.parse('https://todo-lovepeople.herokuapp.com/auth/local/register');
    var response = await http.post(url, body: {
      'username': nome,
      'email': email,
      'password': senha,
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      CadastroDeUsuario resp = CadastroDeUsuario.fromJson(json);
      token = resp.jwt!;

      return login;
    } else {
      return null;
    }
  }

  Future listTodo() async {
    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');
    var response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      ListagemTodo resp = ListagemTodo.fromJson(json);
    }
  }

  Future registersTodo(String titulo, String descricao, String cor) async {
    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');
    var response = await http.post(
      url,
      body: {
        'title': titulo,
        'description': descricao,
        'color': cor,
      },
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      CadastroTodo resp = CadastroTodo.fromJson(json);
    }

    void deleteTodo(String titulo, String descricao, String cor) async {
      var url =
          Uri.parse('https://todo-lovepeople.herokuapp.com/todos/{idTodo}');

      var response = await http.delete(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        DeletarTodo resp = DeletarTodo.fromJson(json);
      }
    }
  }

  Future<LoginDeUsuario?> getLogin() {
    return _Preferences.getLogin();
  }
}
