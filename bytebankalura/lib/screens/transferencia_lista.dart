import 'package:bytebankalura/models/transferencia.dart';
import 'package:bytebankalura/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'transferencia_form.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencias extends StatelessWidget {
  final List<Transferencia> _transferencias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
        backgroundColor: Colors.deepPurple,
      ),
      body: Consumer<Transferencias>(builder: (context, transferencias, child) {
        return ListView.builder(
          itemCount: transferencias.transferencias.length,
          itemBuilder: (context, indice) {
            final transferencia = transferencias.transferencias[indice];
            return ItemTransferencia(transferencia);
          },
        );
      }),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    final formatacaoReal =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(formatacaoReal.format(_transferencia.valor).toString()),
      subtitle: Text(_transferencia.toStringConta()),
    ));
  }
}
