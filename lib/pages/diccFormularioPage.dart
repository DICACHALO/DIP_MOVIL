import 'package:dip_app_flutter/pages/diccListadoPage.dart';
import 'package:dip_app_flutter/providers/firebaseProvider.dart';
import 'package:flutter/material.dart';

class DiccFormularioPage extends StatefulWidget {
  const DiccFormularioPage({Key key}) : super(key: key);
  static final nombrePagina = "formularioDiccionario";
  @override
  _DiccFormularioPageState createState() => _DiccFormularioPageState();
}

class _DiccFormularioPageState extends State<DiccFormularioPage> {
  Map<String, dynamic> diccionario;
  final idForm1 = GlobalKey<
      FormState>(); //Lave identificadora del formulario, cada formulario que se haga debe tener una llave, para asociar todos los elementos dentro del formulario
  Map<String, dynamic> nuevoDiccionario = {};
  @override
  Widget build(BuildContext context) {
    diccionario = ModalRoute.of(context)
        .settings
        .arguments; //Esto se hizo para que funcione 'EDITAR'
    return Scaffold(
        //Plantilla con flecha de devolver y fondo blanco con título
        appBar: AppBar(
          title: Text("Añade tu nuevo diccionario"),
        ),
        body: SingleChildScrollView(
            //Para que no haya desbordamiento de pixeles, sino que haga scroll
            child: Container(
          margin: EdgeInsets.all(10.0),
          child: Form(
            key: idForm1, //Aquí la clave del formulario
            child: Column(children: <Widget>[
              //Column para organizar otros Widget de forma vertical uno debajo del otro
              _crearInputDiccionario(),
              _crearBotonAgregarDiccionario(context),
              _crearBotonVerDiccionario(),
                    ]),
          ),
        )));
  }

  _crearInputDiccionario() {
    return TextFormField(
      //Caja de texto para agregar el nombre de la tarea
      initialValue: (diccionario != null)
          ? diccionario['nombre']
          : "", //Usado para el 'EDITAR'
      onSaved: (valor) {
        nuevoDiccionario['nombre'] =
            valor; //De acuerdo como está en el Provider
      },
      decoration: InputDecoration(hintText: "Diccionario"), //Mensaje de ayuda
    );
  }

  _crearBotonAgregarDiccionario(BuildContext context) {
    return Container(
      //Para poner márgenes y separar los elementos
      margin: EdgeInsets.only(
          top: 20.0), //all si quisiera para todas los espacios del container
      child: RaisedButton(
          //Un botón
          textColor: Colors.white,
          padding: const EdgeInsets.all(20.20),
          color: Colors.deepOrange[600],
          onPressed: () {
            //Al presionar
            idForm1.currentState
                .save(); //Para guardar todos los elementos que estén dentro del formulario
            if (diccionario != null) {
              nuevoDiccionario['id'] = diccionario['id'];
              DipFireBase().editarDiccionario(nuevoDiccionario);
              Navigator.popUntil(
                  context,
                  ModalRoute.withName(DiccListadoPage
                      .nombrePagina)); //Para que se devuelva hasta un punto que yo le voy a decir o sea 'listado'
            } else {
              DipFireBase().agregarDiccionario(
                  nuevoDiccionario); //El método que se creo en tareas_provider.dart
              Navigator.popUntil(
                  context,
                  ModalRoute.withName(DiccListadoPage
                      .nombrePagina)); //Regresar a la página de listado, por eso debo tener un BuildContext context en crearBoton
            }
          },
          child: (diccionario != null)
              ? Text("Editar diccionario", style: TextStyle(fontSize: 17))
              : Text("Crear diccionario", style: TextStyle(fontSize: 17))),
    );
  }

    _crearBotonVerDiccionario() {
    return Container(
      //Para poner márgenes y separar los elementos
      margin: EdgeInsets.only(top: 20.0), //all si quisiera para todas los espacios del container
        child: RaisedButton(
                textColor: Colors.white,
                padding: const EdgeInsets.all(20.20),
                color: Colors.deepOrange[600],
                onPressed:()=> Navigator.pushNamed(context, DiccListadoPage.nombrePagina), 
                child: Text('VER MIS DICCIONARIOS'),
              ));
  } //fin de método agregar botón diccionario
}
