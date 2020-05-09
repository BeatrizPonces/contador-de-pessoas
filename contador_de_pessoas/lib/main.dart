import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _pessoas = 0;
  String _infoText = "Pode Entrar!";

  void _changePessoas(int delta) {
    setState(() {
      _pessoas += delta;

      if(_pessoas < 0){
        _infoText = "Mundo Invertido?!";
      }
      else if(_pessoas == 10){
        _infoText = "  CUIDADO!!\nCORONAVIRUS!!";
      }
      else if(_pessoas > 10){
        _infoText = "SALVE-SE QUEM\n   PUDER!!!";
      }
      else{
        _infoText = "Pode Entrar!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset("images/original.jpg", fit: BoxFit.cover, height: 1000.0),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Text("Pessoas: $_pessoas",
            style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.bold)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                  child: Text("+1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0)),
                  onPressed: () {
                    _changePessoas(1);
                  })),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                  child: Text("-1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0)),
                  onPressed: () {
                    _changePessoas(-1);
                  }))
        ]),
        Text(_infoText,
            style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold))
      ])
    ]);
  }
}
