import 'package:dip_app_flutter/pages/conceptoFormulario.dart';
import 'package:dip_app_flutter/pages/conceptoListado.dart';
import 'package:dip_app_flutter/pages/diccFormularioPage.dart';
import 'package:flutter/material.dart';

class IniciarPage extends StatelessWidget {
  const IniciarPage({Key key}) : super(key: key);
  static final nombrePagina = "iniciar";
  @override
  Widget build(BuildContext context) {
return Scaffold(
      appBar: AppBar(
        title: Text("DICCIONARIO INTERACTIVO"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                child: Image.asset("assets/img/dip_logo-01.png"),
                color: Colors.white,
                width: 150.0,
                height: 300.0),
            RaisedButton(
              textColor: Colors.white,
              padding: const EdgeInsets.all(20.20),
              color: Colors.deepOrange[800],
              child: Text("AGREGAR DICCIONARIOS", style: TextStyle(fontSize: 20)),
               onPressed: () {
                  Navigator.pushNamed(context,DiccFormularioPage.nombrePagina);         
            }),
            const SizedBox(height: 30),
            RaisedButton(
              textColor: Colors.white,
              padding: const EdgeInsets.all(20.20),
              color: Colors.deepOrange[800],
              child:Text("AGREGAR CONCEPTOS", style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.of(context).pushNamed(ConceptoFormularioPage.nombrePagina);
                }),
            const SizedBox(height: 30),
            RaisedButton(
              textColor: Colors.white,
              padding: const EdgeInsets.all(20.20),
              color: Colors.deepOrange[800],
                child: Text("ESTUDIAR", style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.of(context).pushNamed(ConceptoListadoPage.nombrePagina);
                }),
          ],
        ),
      ),
    );
  }
}
