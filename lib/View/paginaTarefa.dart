import 'package:app_todo/View/paginaNovaTarefa.dart';
import 'package:flutter/material.dart';

class ListaDeTarefas extends StatefulWidget {
  const ListaDeTarefas({Key? key}) : super(key: key);

  @override
  State<ListaDeTarefas> createState() => _ListaDeTarefasState();
}

class _ListaDeTarefasState extends State<ListaDeTarefas> {
  List<String> listadeTarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA901F7),
      body: Stack(
        children: [
          Container(
            alignment: AlignmentDirectional.center,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 520),
            child: (const Text(
              'Suas Listagens',
              style: TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat-SemiBold',
                letterSpacing: 1,
              ),
            )),
          ),
          Container(
            height: 125,
            width: 125,
            margin: const EdgeInsets.fromLTRB(0, 0, 250, 0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(225),
              ),
            ),
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
            child: Image.asset(
              'assets/imagens/logo-love.png',
              width: 65,
            ),
          ),
          const SizedBox(
            height: 43,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            height: 47,
            width: 325,
            padding: const EdgeInsets.only(top: 0, bottom: 1),
            margin: const EdgeInsets.only(bottom: 10, top: 200, left: 20),
            child: Center(
              child: TextFormField(
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                  hintText: '    Busque Palavras-Chaves',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Tahoma',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                    color: Color(0xFF3101B9),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    size: 37,
                    color: Color(0xFF3101B9),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(120, 600, 0, 0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => NovaTarefa(),
                  ),
                );
              },
              child: Icon(
                Icons.add_outlined,
                size: 80,
                color: Colors.white,
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xFFA901F7))),
            ),
          ),
        ],
      ),
    );
  }
}

void novaTarefa(context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => NovaTarefa(),
    ),
  );
}
