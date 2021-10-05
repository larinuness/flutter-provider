import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  //parametros opcionais porque não é obrigado a por todos
  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return //Colocar margin interna
        Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        //Style é usado parar modificar algo em texto, ex: cor, tamanho
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
            labelText: rotulo,
            icon: icone != null
                ? Icon(
                    icone,
                    color: Colors.green,
                  )
                : null,
            //Mudando cor da linha da label embaixo
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
            ),
            labelStyle: TextStyle(
              color: Colors.black54,
            ),
            //texto dentro da label
            hintText: dica),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
