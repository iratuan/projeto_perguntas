import 'package:flutter/material.dart';
import 'components/questionario.dart';
import 'components/resultado.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _potuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 5},
        {'texto': 'Cobra', 'pontuacao': 10},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 2},
      ]
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 3},
        {'texto': 'João', 'pontuacao': 5},
        {'texto': 'Leo', 'pontuacao': 10},
        {'texto': 'Pedro', 'pontuacao': 1},
      ]
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _potuacaoTotal += pontuacao;
        _perguntaSelecionada++;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _potuacaoTotal = 0;
      _perguntaSelecionada = 0;
    });
    print("Reiniciando os valores do app");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Novo Flutter App'),
      ),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              responder: _responder)
          : Resultado(_potuacaoTotal, _reiniciarQuestionario),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState() => _PerguntaAppState();
}
