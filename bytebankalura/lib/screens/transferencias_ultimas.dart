import 'package:bytebankalura/models/transferencias.dart';
import 'package:bytebankalura/screens/transferencia_lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UltimasTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Últimas transferências',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        Consumer<Transferencias>(builder: (context, transferencias, child) {
          //pega o array de transferências, invertendo e transformando novamente numa lista
          final _ultimasTransferencias =
              transferencias.transferencias.reversed.toList();
          final _quantidade = transferencias.transferencias.length;
          int tamanho = 2;

          if (_quantidade == 0) {
            return SemTransferenciaCadastratada();
          }

          if (_quantidade < 2) {
            tamanho = _quantidade;
          }
          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: tamanho,
            shrinkWrap: true,
            itemBuilder: (context, indice) {
              return ItemTransferencia(_ultimasTransferencias[indice]);
            },
          );
        }),
        Container(
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListaTransferencias()));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Ver todas transferências',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}

class SemTransferenciaCadastratada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Você ainda não cadastrou\n nenhuma transferência',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
