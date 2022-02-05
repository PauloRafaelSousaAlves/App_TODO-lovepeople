import 'package:app_todo/View/paginaCadastroConcluido.dart';
import 'package:app_todo/View/paginaLogin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CadastroUsuario extends StatefulWidget {
  const CadastroUsuario({Key? key}) : super(key: key);

  @override
  State<CadastroUsuario> createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  final _formkey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmacaoController = TextEditingController();
  final bool _enableObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA901F7),
      body: Consumer(
        builder: (context, controller, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Vamos começar!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nomeController,
                        validator: (value) {
                          if (value == null || value.trim().length == null) {
                            return 'Por favor, digite seu nome.';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(13),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(11)),
                          ),
                          hintText: 'Nome',
                          hintStyle: TextStyle(color: Color(0xFFA901F7)),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().length == null) {
                                  return 'Por favor, digite seu e-mail!';
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
                                hintStyle: TextStyle(color: Color(0xFFA901F7)),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 0, right: 0),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _senhaController,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().length == null) {
                                        return 'Por favor, digite sua senha!';
                                      }
                                      return null;
                                    },
                                    obscureText: _enableObscure,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(13),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(11)),
                                      ),
                                      hintText: 'Senha',
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
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 0),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: _confirmacaoController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.trim().length == null) {
                                              return 'Confirme sua senha!';
                                            }
                                            return null;
                                          },
                                          obscureText: _enableObscure,
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(13),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(11)),
                                            ),
                                            hintText: 'Confirmar senha',
                                            hintStyle: TextStyle(
                                                color: Color(0xFFA901F7)),
                                            fillColor: Colors.white,
                                            filled: true,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Container(
                                            height: 45,
                                            width: 130,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: const Text(
                                                "Cadastrar",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Color(0xFF3101B9)),
                                                  shape: MaterialStateProperty
                                                      .all(RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          side:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 1)))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
            padding: EdgeInsets.only(bottom: 10),
            child: Divider(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Já possui cadastro?',
                  style: TextStyle(color: Colors.white),
                ),
                InkWell(
                  child: const Text(
                    'Entrar!',
                    style: TextStyle(color: Colors.orange),
                  ),
                  onTap: () {
                    telaLogin(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void cadastroConcluido(context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => PaginaCadastroConcluido(),
    ),
  );
}

void telaLogin(context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => LoginPage(),
    ),
  );
}
