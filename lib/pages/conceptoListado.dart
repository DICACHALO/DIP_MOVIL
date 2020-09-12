import 'package:dip_app_flutter/pages/conceptoFormulario.dart';
import 'package:dip_app_flutter/pages/editarConceptoPage.dart';
import 'package:dip_app_flutter/providers/firebaseProvider.dart';
import 'package:flutter/material.dart';

class ConceptoListadoPage extends StatefulWidget {
  ConceptoListadoPage({Key key}) : super(key: key);
  static final nombrePagina = "conceptosListado";
  @override
  _ConceptoListadoPageState createState() => _ConceptoListadoPageState();
}

class _ConceptoListadoPageState extends State<ConceptoListadoPage> {
  List<Map<String,dynamic>> conceptos = [];
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
          title: Text('Mis conceptos'),
      ),
      body: FutureBuilder(
            future: DipFireBase().conceptos,
            builder: (BuildContext contexto, AsyncSnapshot respuesta){
              if(respuesta.hasData){
                conceptos=respuesta.data;
                return conceptos.isNotEmpty ? ListView(
                  children: _crearItem(context)
                  ): 
                  Center(
                  child: Text("No hay conceptos agregadas"),
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
            ConceptoFormularioPage
                .nombrePagina), 
        child: Icon(Icons.add),
      ),
    );
  }

  List<Widget> _crearItem(BuildContext context) {
    List<Widget> temporal = []; 
    for (Map<String, dynamic> concepto in conceptos) {
      Widget item = ListTile(
        onTap: () => Navigator.pushNamed(context, DetallePageConcepto.nombrePagina,
            arguments: concepto), 
        title: Text(
            "${concepto['nombre']}"), 
      );
      temporal.add(item);
    }
    return temporal;
  }
}
