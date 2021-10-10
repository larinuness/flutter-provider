class Transferencia {
  final double valor;
  final int numConta;

  Transferencia(this.valor, this.numConta);

  String toStringValor() {
    return '$valor';
  }

  String toStringConta() {
    return 'Conta: $numConta';
  }
}
