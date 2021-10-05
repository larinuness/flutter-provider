import 'package:bytebankalura/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'form.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then(
            (transferenciaRecebida) => _atualiza(transferenciaRecebida),
          );
        },
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    setState(() {
      widget._transferencias.add(transferenciaRecebida);
    });
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
      subtitle: Text(_transferencia.numConta.toString()),
    ));
  }
}
