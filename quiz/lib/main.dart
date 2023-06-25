import 'package:flutter/material.dart';
import 'package:projeto_quiz/resultado.dart';
import 'package:projeto_quiz/questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      "texto": "Qual é a sua cor favorita?",
      "respostas": [
        {"texto": "Verde", "pontuacao": 10},
        {"texto": "Roxo", "pontuacao": 8},
        {"texto": "Rosa", "pontuacao": 3}
      ]
    },
    {
      "texto": "Qual é o seu animal favorito?",
      "respostas": [
        {"texto": "Gato", "pontuacao": 10},
        {"texto": "Elefante", "pontuacao": 2},
        {"texto": "Formiga", "pontuacao": 1}
      ]
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
