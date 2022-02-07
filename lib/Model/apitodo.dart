import 'dart:convert';
import 'package:app_todo/Model/Api/apiCadastroDeUsuario.dart';
import 'package:app_todo/Model/Api/apiCadastroTodo.dart';
import 'package:app_todo/Model/Api/apiDeleteTodo.dart';
import 'package:app_todo/Model/Api/apiListagemTodo.dart';
import 'package:app_todo/Model/Api/apiLoginDeUsuario.dart';
import 'package:http/http.dart ' as http;

class TodoApi {
  String token = '';

  bool isLoading = false;

  get deleteTodo => null;

  Future login(String email, String senha) async {
    var url = Uri.parse('https:todo-lovepeople.herokuapp.com/auth/local');
    var response = await http.post(
      url,
      body: {
        'identifier': email,
        'password': senha,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      LoginDeUsuario resp = LoginDeUsuario.fromJson(json);
      token = resp.jwt!;
    }
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
    var response = await http.get(
      url,
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
}
