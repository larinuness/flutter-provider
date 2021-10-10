import 'package:bytebankalura/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/editor.dart';

const _dicaCampoValor = '0,00';
const _rotuloCampoValor = 'Valor';

class FormDeposito extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receber depósito'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              dica: _dicaCampoValor,
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text('Confirmar', style: TextStyle(fontSize: 20)),
              onPressed: () {
                _criaDeposito(context);
              },
              style: ElevatedButton.styleFrom(
                //mudando cor
                primary: Colors.deepPurple,
                //mudando tamanho
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

  _criaDeposito(context) {
    final double? valor = double.tryParse(_controladorCampoValor.text);
    final depositoValido = _validaDeposito(valor);

    if (depositoValido) {
      _atualizaEstado(context, valor);
      Navigator.pop(context);
    }
  }

  _validaDeposito(valor) {
    final _campoPreenchido = valor != null;
    return _campoPreenchido;
  }

  _atualizaEstado(context, valor) {
    Provider.of<Saldo>(context, listen: false).adiciona(valor);
  }
}
