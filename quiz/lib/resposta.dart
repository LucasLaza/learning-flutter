import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() naSelecao;

  Resposta(this.texto, this.naSelecao);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
        ),
        child: Text(texto),
        onPressed: naSelecao,
      ),
    );
  }
}
