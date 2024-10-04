import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) responder;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : {};

    return Container(
      child: Column(
        children: [
          Questao(perguntas[perguntaSelecionada]['texto'].toString()),
          ...respostas.map((t) => Resposta(t['texto'].toString(),
              () => responder(int.parse(t['pontuacao'].toString())))),
        ],
      ),
    );
  }
}
