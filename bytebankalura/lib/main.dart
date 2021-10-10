import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/saldo.dart';
import 'models/transferencias.dart';
import 'screens/dashborad.dart';

void main() =>
  //Quando algo muda vai notificar, um observador
  //multiprovider pode usar em varios lugares e classes diferentes
  runApp(MultiProvider(
    providers:[
      ChangeNotifierProvider(create: (context) => Saldo(0)),
      ChangeNotifierProvider(create: (context) => Transferencias())
    ],
    child: BytebankApp(),
  ),
  );


class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.deepPurple),
        primaryColor: Colors.deepPurple,
        //mudar cor do icone
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
