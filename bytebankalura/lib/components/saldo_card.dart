import 'package:bytebankalura/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SaldoCard extends StatelessWidget {
  final formatacaoReal = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Card(
        //deixa borda redonda
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Consumer<Saldo>(
            //context criar um build, recebe o valor da model saldo, child
            //child quem vai ser buildado
            builder: (context, valor, child) {
              return Text(
                formatacaoReal.format(valor.valor).toString(),
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
              );
            },
          ),
        ),
      ),
    );
  }
}
