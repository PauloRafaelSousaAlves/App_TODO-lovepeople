import 'dart:convert';
import 'package:app_todo/Presenter/login_presenter.dart';
import 'package:app_todo/View/paginaCadastro.dart';
import 'package:app_todo/View/paginaTarefa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart ' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passowrdController = TextEditingController();
  final bool _enableObscure = true;

  @override
  void didChangeDependencies() {
    context.read<LoginPresenter>().obterLogin('email', 'senha', () {}, () {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA901F7),
      body: Consumer(
        builder: (context, controller, _) {
          return Column(
            children: [
              Container(
                height: 210,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(210),
                    bottomRight: Radius.circular(210),
                  ),
                ),
                child: Center(
                  child: SizedBox(
                    width: 110,
                    height: 110,
                    child: Image.asset('assets/imagens/logo-love.png'),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 1),
                        child: Text(
                          'Que bom que voltou!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 5,
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Form(
                        key: _formkey,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _emailController,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().length == null) {
                                    return 'Por favor, digite o e-mail!';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(13),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(11)),
                                  ),
                                  hintText: 'E-mail',
                                  hintStyle:
                                      TextStyle(color: Color(0xFFA901F7)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 0, right: 0),
                                child: TextFormField(
                                  controller: _passowrdController,
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().length == null) {
                                      return 'Por favor, digite a senha!';
                                    }
                                    return null;
                                  },
                                  obscureText: _enableObscure,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(13),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(11)),
                                    ),
                                    hintText: 'Passoword',
                                    hintStyle:
                                        TextStyle(color: Color(0xFFA901F7)),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(45),
                                child: Container(
                                  height: 45,
                                  width: 110,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Entrar",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0xFF3101B9)),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          side: const BorderSide(
                                              color: Colors.white, width: 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              height: 7,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Não possui cadastro?',
                  style: TextStyle(color: Colors.white),
                ),
                InkWell(
                  child: const Text(
                    'Clique aqui!',
                    style: TextStyle(color: Colors.orange),
                  ),
                  onTap: () {
                    novoCadastro(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void paginaDaLista(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ListaDeTarefas(),
      ),
    );
  }

  void novoCadastro(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CadastroUsuario(),
      ),
    );
  }
}
