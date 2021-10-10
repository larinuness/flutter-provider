import 'package:bytebankalura/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/editor.dart';
import '../models/transferencia.dart';
import '../models/transferencias.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0,00';
const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';

class FormTransferencia extends StatelessWidget {
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
    final transferenciaValida = _validaTransferencia(numConta, valor, context);

    if (transferenciaValida) {
      final novaTransferencia = Transferencia(valor!, numConta!);
      _atualizaEstado(context, novaTransferencia, valor);
      Navigator.pop(context);
    }
  }

  _validaTransferencia(numConta, valor, context) {
    final _camposPreenchidos = numConta != null && valor != null;
    final _saldoSuficiente =
        valor <= Provider.of<Saldo>(context, listen: false).valor;

    return _camposPreenchidos && _saldoSuficiente;
  }

  _atualizaEstado(context, novaTransferencia, valor) {
    Provider.of<Transferencias>(context, listen: false)
        .adicionaItem(novaTransferencia);
    Provider.of<Saldo>(context, listen: false).remove(valor);
  }
}
