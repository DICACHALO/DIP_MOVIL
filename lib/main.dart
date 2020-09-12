import 'package:dip_app_flutter/pages/conceptoFormulario.dart';
import 'package:dip_app_flutter/pages/conceptoListado.dart';
import 'package:dip_app_flutter/pages/diccFormularioPage.dart';
import 'package:dip_app_flutter/pages/diccListadoPage.dart';
import 'package:dip_app_flutter/pages/editarConceptoPage.dart';
import 'package:dip_app_flutter/pages/editarDiccPage.dart';
import 'package:flutter/material.dart';
import 'pages/iniciarPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diccionario interactivo personalizado',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: IniciarPage.nombrePagina, //Hay que decirle cuál es la ruta inicial
      routes: { //Primero identificar la clase del Widget, con una variable de tipo static
                //Routes recibe un mapa
                //Si usamos routes ya no necesitamos home
        IniciarPage.nombrePagina: (BuildContext context)=>IniciarPage(),
        ConceptoFormularioPage.nombrePagina: (BuildContext context)=>ConceptoFormularioPage(),
        ConceptoListadoPage.nombrePagina: (BuildContext context)=>ConceptoListadoPage(),
        DetallePageConcepto.nombrePagina: (BuildContext context)=>DetallePageConcepto(),
        DiccFormularioPage.nombrePagina: (BuildContext context)=>DiccFormularioPage(),
        DiccListadoPage.nombrePagina: (BuildContext context)=>DiccListadoPage(),
        EditarDiccionarioPage.nombrePagina: (BuildContext context)=>EditarDiccionarioPage(),
      });
  }
}