import 'package:app_todo/Presenter/login_presenter.dart';
import 'package:app_todo/View/paginaLogin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Presenter/cadastro_presenter.dart';
import 'Presenter/novaTarefa_presenter.dart';
import 'Presenter/tarefa_presenter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginPresenter()),
        ChangeNotifierProvider(create: (_) => CadastroDeUsuario2()),
        ChangeNotifierProvider(create: (_) => TarefaPresenter()),
        ChangeNotifierProvider(create: (_) => NovaTarefaPresenter()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
