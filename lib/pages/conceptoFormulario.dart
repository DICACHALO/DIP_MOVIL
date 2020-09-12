import 'package:dip_app_flutter/pages/conceptoListado.dart';
import 'package:dip_app_flutter/providers/firebaseProvider.dart';
import 'package:flutter/material.dart';

class ConceptoFormularioPage extends StatefulWidget {
  ConceptoFormularioPage({Key key}) : super(key: key);
  static final nombrePagina =
      "formularioConcepto"; //Variable para determinar a dónde se quiere ir, es decir las rutas que se han definido en el main
  @override
  _ConceptoFormularioPageState createState() => _ConceptoFormularioPageState();
}

class _ConceptoFormularioPageState extends State<ConceptoFormularioPage> {
  Map<String, dynamic>
      concepto; //Variable global para poderla utilizar en todo el formulario - se hizo cuando se necesitó el 'EDITAR'
  final idForm2 = GlobalKey<
      FormState>(); //Lave identificadora del formulario, cada formulario que se haga debe tener una llave, para asociar todos los elementos dentro del formulario
  Map<String, dynamic> nuevoConcepto =
      {}; //Mapa que recibe los datos de la nueva tarea del formulario
  @override
  Widget build(BuildContext context) {
    concepto = ModalRoute.of(context)
        .settings
        .arguments; //Esto se hizo para que funcione 'EDITAR'
    return Scaffold(
        //Plantilla con flecha de devolver y fondo blanco con título
        appBar: AppBar(
          title: Text("Añade conceptos"),
        ),
        body: SingleChildScrollView(
            //Para que no haya desbordamiento de pixeles, sino que haga scroll
            child: Container(
          margin: EdgeInsets.all(10.0),
          child: Form(
            key: idForm2, //Aquí la clave del formulario
            child: Column(children: <Widget>[
              //Column para organizar otros Widget de forma vertical uno debajo del otro
              _crearInputNombre(),
              _crearInputSignificado(),
              _crearBotonAgregar(context),
            ]),
          ),
        )));
  }

  _crearInputNombre() {
    return TextFormField(
      //Caja de texto para agregar el nombre de la tarea
      initialValue:
          (concepto != null) ? concepto['nombre'] : "", //Usado para el 'EDITAR'
      onSaved: (valor) {
        nuevoConcepto['nombre'] = valor; //De acuerdo como está en el Provider
      },
      decoration: InputDecoration(hintText: "Concepto"), //Mensaje de ayuda
    );
  }

  _crearInputSignificado() {
    return Container(
      margin: EdgeInsets.only(top: 20.0), //Márgenes
      child: TextFormField(
          initialValue: (concepto != null)
              ? concepto['significado']
              : "", //Usado para el 'EDITAR'
          onSaved: (valor) {
            //Um evento que se dispara cuando le doy clic al botón
            nuevoConcepto['significado'] = valor;
          },
          maxLines:
              null, //Cantidad de líneas cuando le doy enter, en este caso las que quiera
          decoration: InputDecoration(hintText: "Significado")),
    );
  }

  _crearBotonAgregar(BuildContext context) {
    return Container(
      //Para poner márgenes y separar los elementos
      margin: EdgeInsets.only(
          top: 20.0), //all si quisiera para todas los espacios del container
      child: RaisedButton(
          //Un bóntón
          textColor: Colors.white,
          padding: const EdgeInsets.all(20.20),
          color: Colors.deepOrange[600],
          onPressed: () {
            //Al presionar
            idForm2.currentState
                .save(); //Para guardar todos los elementos que estén dentro del formulario
            nuevoConcepto['tipo'] = false;
            if (concepto != null) {
              nuevoConcepto['id'] = concepto['id'];
              DipFireBase().editarConcepto(nuevoConcepto);
              Navigator.popUntil(
                  context,
                  ModalRoute.withName(ConceptoListadoPage
                      .nombrePagina)); //Para que se devuelva hasta un punto que yo le voy a decir o sea 'listado'
            } else {
              DipFireBase().agregarConcepto(
                  nuevoConcepto); //El método que se creo en tareas_provider.dart
              Navigator.popUntil(
                  context,
                  ModalRoute.withName(ConceptoListadoPage
                      .nombrePagina)); //Regresar a la página de listado, por eso debo tener un BuildContext context en crearBoton
            }
          },
          child: (concepto != null)
              ? Text("Editar concepto", style: TextStyle(fontSize: 17))
              : Text("Crear concepto", style: TextStyle(fontSize: 17))),
    );
  }
}
