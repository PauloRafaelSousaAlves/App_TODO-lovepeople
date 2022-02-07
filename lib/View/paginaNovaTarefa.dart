import 'package:flutter/material.dart';

class NovaTarefa extends StatefulWidget {
  NovaTarefa({Key? key}) : super(key: key);

  @override
  State<NovaTarefa> createState() => _NovaTarefaState();
}

class _NovaTarefaState extends State<NovaTarefa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA901F7),
      body: Center(
        child: Stack(
          children: [
            Container(
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 520),
              child: (const Text(
                'Nova Tarefa',
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
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.fromLTRB(25, 170, 25, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                  hintText: '   Título da Tarefa',
                  hintStyle: TextStyle(
                    color: Color(0xff3101B9),
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 250,
              margin: const EdgeInsets.fromLTRB(25, 250, 25, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                maxLines: 15,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  hintText: '    Escreva uma descrição para sua tarefa.',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff3101B9).withOpacity(0.5),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 100,
            ),
            Container(
              margin: EdgeInsets.only(left: 0, right: 10, top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 600, 0, 0),
                  ),
                  FloatingActionButton(
                    backgroundColor: Color(0xffFFF2CC),
                    onPressed: () {},
                  ),
                  FloatingActionButton(
                    backgroundColor: Color(0xffFFD9F0),
                    onPressed: () {},
                  ),
                  FloatingActionButton(
                    backgroundColor: Color(0xffE8C5FF),
                    onPressed: () {},
                  ),
                  FloatingActionButton(
                    backgroundColor: Color(0xffCAFBFF),
                    onPressed: () {},
                  ),
                  FloatingActionButton(
                    backgroundColor: Color(0xffE3FFE6),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 630, left: 41),
              child: IconButton(
                icon: Icon(Icons.close),
                iconSize: 75,
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 630, left: 270),
              child: IconButton(
                icon: Icon(Icons.done),
                iconSize: 75,
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
