import 'package:dip_app_flutter/pages/conceptoFormulario.dart';
import 'package:dip_app_flutter/pages/conceptoListado.dart';
import 'package:dip_app_flutter/providers/firebaseProvider.dart';
import 'package:flutter/material.dart';

class DetallePageConcepto extends StatelessWidget {
  const DetallePageConcepto({Key key}) : super(key: key);
static final nombrePagina = 'detalleConcepto'; //Esto es para organizar la ruta
  @override
  Widget build(BuildContext context) {
 Map<String, dynamic> concepto = ModalRoute.of(context).settings.arguments; //ModalRoute es una clase que gestiona toda la información de la ruta que estoy manejando en mi navegación y lo estoy usando para atrapar los parámetros
    return Scaffold(
      appBar: AppBar(
        title: Text("Estudiando mis conceptos"),
      ),
      body: Column(
        children: <Widget>[
          Container(
          margin: EdgeInsets.only( //Añadir espacios
            top: 20.0,
            bottom: 40.0
          ),
          child: Text("${concepto['nombre']}", style: TextStyle(fontSize: 20.0),) //Tamaño de la letra de 'nombre'
          // SizedBox(height: 20.0,), //Otra forma para añadir un espacio
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20.0,
              bottom: 40.0
            ),
            child: Text("${concepto['significado']}")),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, //Espacios entre los botones
            children: <Widget>[
                RaisedButton( //Botón EDITAR
                color: Colors.blue,
                textColor: Colors.white,
                
                onPressed: (){
                  DipFireBase().editarConcepto(concepto);
                  Navigator.pushNamed(context,ConceptoFormularioPage.nombrePagina, arguments: concepto);
                },
                child: Text("Editar"),
                ),
                RaisedButton( //Botón ELIMINAR
                color: Colors.red, 
                textColor: Colors.white, 
                onPressed: (){
                  DipFireBase().eliminarConcepto(concepto);
                  Navigator.pushNamed(context,ConceptoListadoPage.nombrePagina, arguments: concepto);
                },
                child: Text("Eliminar"),
                ),
            ],
          )
        ],
      ),
    );
  }
}