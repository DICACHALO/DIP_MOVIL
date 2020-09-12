import 'package:dip_app_flutter/pages/diccFormularioPage.dart';
import 'package:dip_app_flutter/pages/diccListadoPage.dart';
import 'package:dip_app_flutter/providers/firebaseProvider.dart';
import 'package:flutter/material.dart';
class EditarDiccionarioPage extends StatelessWidget {
  const EditarDiccionarioPage({Key key}) : super(key: key);
  static final nombrePagina = "detalleDiccionario"; 
  @override
  Widget build(BuildContext context) {
  Map<String, dynamic> diccionario = ModalRoute.of(context).settings.arguments; //ModalRoute es una clase que gestiona toda la información de la ruta que estoy manejando en mi navegación y lo estoy usando para atrapar los parámetros
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar diccionarios"),
      ),
      body: Column(
        children: <Widget>[
          Container(
          margin: EdgeInsets.only( //Añadir espacios
            top: 20.0,
            bottom: 40.0
          ),
          child: Text("${diccionario['nombre']}", style: TextStyle(fontSize: 20.0),) //Tamaño de la letra de 'nombre'
          // SizedBox(height: 20.0,), //Otra forma para añadir un espacio
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, //Espacios entre los botones
            children: <Widget>[
                RaisedButton( //Botón EDITAR
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: (){
                  DipFireBase().editarDiccionario(diccionario);
                  Navigator.pushNamed(context, DiccFormularioPage.nombrePagina, arguments: diccionario);
                },
                child: Text("Editar"),
                ),
                RaisedButton( //Botón ELIMINAR
                color: Colors.red, 
                textColor: Colors.white, 
                child: Text("Eliminar"),
                onPressed: (){
                  DipFireBase().eliminarDiccionario(diccionario);
                  Navigator.pushNamed(context,DiccListadoPage.nombrePagina, arguments: diccionario);
                },
                
                ),
            ],
          )
        ],
      ),
    );
  }
}