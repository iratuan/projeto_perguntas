import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

   Resultado(this.pontuacao, this.reiniciarQuestionario);

  String get fraseResultado{
  
    if(pontuacao < 8){
      return "Parabéns";
    }else if(pontuacao < 12){
      return "Você é bom!";
    }else if(pontuacao < 16){
      return "Impressionante";
    }else{
      return "Nível JEDI";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onPressed: reiniciarQuestionario,
        child: Text("Voltar para o início"),
      )
      ],
    );
  }
}
