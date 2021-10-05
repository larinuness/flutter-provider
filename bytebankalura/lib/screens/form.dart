import 'package:bytebankalura/components/editor.dart';
import 'package:bytebankalura/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controlador: _controladorCampoNumeroConta,
                dica: _dicaCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta,
              ),
              Editor(
                dica: _dicaCampoValor,
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                child: Text('Confirmar', style: TextStyle(fontSize: 20)),
                onPressed: () {
                  _criaTransferencia(context);
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
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int? numConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
