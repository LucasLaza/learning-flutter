import 'package:flutter/material.dart';
import 'package:projeto_quiz/questao.dart';
import 'package:projeto_quiz/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>>? respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]["respostas"]
            as List<Map<String, Object>>
        : null;

    return Column(children: [
      Questao(perguntas[perguntaSelecionada]["texto"].toString()),
      ...respostas!.map((resp) {
        return Resposta(resp["texto"].toString(),
            () => quandoResponder(int.parse(resp['pontuacao'].toString())));
      })
    ]);
  }
}
