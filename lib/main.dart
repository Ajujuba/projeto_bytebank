import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
        children: <Widget>[
          Editor(controlador: _controladorCampoNumeroConta, rotulo: 'Numero da conta', dica: '0000'),
          Editor(controlador: _controladorCampoValor, rotulo: 'Valor', dica: '0.00', icone: Icons.monetization_on,),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () {
              _criaTransferencia(context);
            },
          )
        ],
      ),
    );
  }
  void _criaTransferencia(BuildContext context){
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if(numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      //debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}


class Editor extends StatelessWidget {

  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null, //if ternario
            labelText: rotulo,
            hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}


class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
          children: <Widget>[
            ItemTransferencia(Transferencia(100.0, 1000)),
            ItemTransferencia(Transferencia(200.0, 2000)),
            ItemTransferencia(Transferencia(300.0, 3000)),
          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context){
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida){
            debugPrint('$transferenciaRecebida');
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}