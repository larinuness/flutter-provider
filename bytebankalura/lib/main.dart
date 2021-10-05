import 'package:flutter/material.dart';

import 'screens/lista.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          //mudar cor do icone
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurple)),
      debugShowCheckedModeBanner: false,
      home: ListaTransferencias(),
    );
  }
}
