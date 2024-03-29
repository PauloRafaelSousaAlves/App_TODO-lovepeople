import 'package:app_todo/Presenter/novaTarefa_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NovaTarefa extends StatefulWidget {
  NovaTarefa({Key? key}) : super(key: key);

  @override
  State<NovaTarefa> createState() => _NovaTarefaState();
}

class _NovaTarefaState extends State<NovaTarefa> {
  final _formkey = GlobalKey<FormState>();
  final _controlerAssignment = TextEditingController();
  final _controlerTitle = TextEditingController();

  late String _colorTarefa = '';
  final _colorsTarefas = ['FFF2CC', 'FFD9F0', 'E8C5FF', 'CAFBFF', 'E3FFE6'];
  var value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA901F7),
      body: Consumer<NovaTarefaPresenter>(
        builder: (context, controller, child) {
          return Stack(
            children: [
              Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                            width: 30,
                          ),
                          Center(
                            child: Container(
                                alignment: AlignmentDirectional.topCenter,
                                child: const Text(
                                  'Nova Tarefa',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                margin:
                                    const EdgeInsets.fromLTRB(40, 40, 40, 50)),
                          ),
                          TextFormField(
                            controller: _controlerTitle,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Preenchimento obrigatorio!';
                              }
                            },
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Color(0xff3101B9),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: ('Título tarefa'),
                              hintStyle: const TextStyle(
                                color: Color(0xFF3101B9),
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFA901F7),
                                      width: 5,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 255,
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 50,
                              textAlign: TextAlign.left,
                              controller: _controlerAssignment,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Preenchimento obrigatorio!';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText:
                                    ('Escreva uma descrição para sua tarefa.'),
                                hintStyle: TextStyle(
                                  color:
                                      const Color(0xFF3101B9).withOpacity(0.5),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              alignment: AlignmentDirectional.topStart,
                              child: mapaDeCores(),
                              margin: const EdgeInsets.only(
                                top: 10,
                                left: 40,
                                right: 40,
                              ),
                              height: 40,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.transparent),
                                      elevation: MaterialStateProperty.all(0),
                                    ),
                                    onPressed: () {
                                      (Navigator.of(context).pop(value));
                                      if (_formkey.currentState!.validate()) {}
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 70,
                                    )),
                                const SizedBox(
                                  width: 80,
                                ),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.transparent),
                                        elevation:
                                            MaterialStateProperty.all(0)),
                                    onPressed: () {
                                      String title = _controlerTitle.text;
                                      String assignment =
                                          _controlerAssignment.text;
                                      if (title.isNotEmpty &&
                                          assignment.isNotEmpty) {
                                        controller.novaTarefa(
                                          title,
                                          assignment,
                                          _colorTarefa,
                                          () {
                                            Navigator.of(context).pop(true);
                                          },
                                          () {
                                            const snackBar = SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Text(
                                                  'Sua tarefa não foi cadastrada'),
                                            );

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          },
                                        );
                                      }
                                    },
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 70,
                                    ))
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(2, 20, 15, 30),
                height: 110,
                width: 110,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(3),
                    bottomRight: Radius.circular(90),
                    topRight: Radius.circular(3),
                  ),
                ),
                child: Image.asset(
                  'assets/imagens/logo-love.png',
                  fit: BoxFit.contain,
                  height: 40,
                  width: 40,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  ListView mapaDeCores() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _colorsTarefas.length,
      itemBuilder: (context, index) {
        final colorButton = '0xFF${_colorsTarefas[index]}';
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            primary: Color(
              int.parse(colorButton),
            ),
            elevation: _colorTarefa == _colorsTarefas[index] ? 10 : 0,
          ),
          onPressed: () {
            setState(() {
              _colorTarefa = _colorsTarefas[index];
            });
          },
          child: const SizedBox(
            width: 20,
          ),
        );
      },
    );
  }
}
