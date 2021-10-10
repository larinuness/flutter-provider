import 'package:flutter/material.dart';

class Saldo extends ChangeNotifier {
  late double valor;

  Saldo(this.valor);

  void adiciona(double valor) {
    this.valor += valor;
    notifyListeners();
  }

  void remove(double valor) {
    this.valor -= valor;
    notifyListeners();
  }

  @override
  String toString() {
    return 'R\$ $valor'.replaceAll('.', ',');
  }
}
