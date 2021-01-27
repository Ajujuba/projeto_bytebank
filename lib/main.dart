import 'package:bytebank/screens/lista_transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.teal[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.teal[700],
          textTheme: ButtonTextTheme.primary
        ),
      ),
      home: ListaTransferencias()
    );
  }
}








