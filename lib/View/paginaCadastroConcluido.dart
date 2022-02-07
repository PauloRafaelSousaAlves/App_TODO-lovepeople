import 'package:app_todo/View/paginaTarefa.dart';
import 'package:flutter/material.dart';

class CadastroConcluido extends StatefulWidget {
  const CadastroConcluido({Key? key}) : super(key: key);

  @override
  State<CadastroConcluido> createState() => _CadastroConcluidoState();
}

class _CadastroConcluidoState extends State<CadastroConcluido> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFA901F7),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin:
                          const EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
                      child: const Text(
                        "Cadastro Concluído!",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        telaTodo(context);
                      },
                      child: const Text(
                        'Começar',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF3101B9)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side:
                                const BorderSide(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 180,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(210),
                  topRight: Radius.circular(210),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                child: Center(
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset('assets/imagens/Ada-voando.png'),
                  ),
                ),
              ),
            ),
            Container(
              height: 30,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  'Os ventos da programação estão indo até você',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF3101B9),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void telaTodo(context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => ListaDeTarefas(),
    ),
  );
}
