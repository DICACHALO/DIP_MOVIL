import 'package:dip_app_flutter/pages/diccFormularioPage.dart';
import 'package:dip_app_flutter/pages/editarDiccPage.dart';
import 'package:dip_app_flutter/pages/iniciarPage.dart';
import 'package:dip_app_flutter/providers/firebaseProvider.dart';
import 'package:flutter/material.dart';

class DiccListadoPage extends StatefulWidget {
  DiccListadoPage({Key key}) : super(key: key);
  static final nombrePagina = "diccionariosListado";
  @override
  _DiccListadoPageState createState() => _DiccListadoPageState();
}

class _DiccListadoPageState extends State<DiccListadoPage> {
  List<Map<String,dynamic>> diccionarios= [];
  @override
  Widget build(BuildContext context) {
return Scaffold(
      appBar: AppBar(
          title: Text('Mis diccionarios'),
      ),
      body: FutureBuilder(
            future: DipFireBase().diccionarios,
            builder: (BuildContext contexto, AsyncSnapshot respuesta){
              if(respuesta.hasData){
                diccionarios=respuesta.data;
                return diccionarios.isNotEmpty ? ListView(
                  children: _crearDicc(context)
                  ): 
                  Center(
                  child: Text("No hay diccionarios agregadas"),
                  );
            } else{
              return Center(child: CircularProgressIndicator(),
              );
            }
        }     
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=> Navigator.pushNamed(
            context,
            DiccFormularioPage
                .nombrePagina), 
        child: Icon(Icons.add),
      ),
    );
  }

  List<Widget> _crearDicc(BuildContext context) {
    List<Widget> temporal = []; 
    for (Map<String, dynamic> diccionario in diccionarios) {
      Widget item = ListTile(
        onTap: () => Navigator.pushNamed(context, EditarDiccionarioPage.nombrePagina, //Detalle
            arguments: diccionario), 
        title: Text(
            "${diccionario['nombre']}"), 
      );
      temporal.add(item);
    }
    return temporal;
  }
}

