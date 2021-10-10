//esse model de transferências vai ser responsável por armazenar para nós
//todas as transferências que nós temos salvas na nossa aplicação.

import 'package:bytebankalura/models/transferencia.dart';
import 'package:flutter/material.dart';

//changeNotifier pra pode usar no main
class Transferencias extends ChangeNotifier {
  final List<Transferencia> _transferencias = [];

  //getter pra pegar os valores da lista
  List<Transferencia> get transferencias => _transferencias;

  adicionaItem(Transferencia novaTransferencia) {
    transferencias.add(novaTransferencia);
    notifyListeners();
  }
}
