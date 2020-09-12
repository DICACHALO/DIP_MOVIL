//Estructura Singleton
import 'dart:convert';
import 'package:http/http.dart' as http; //Paquete para conexión con FIREBASE

class DipFireBase {
  static final DipFireBase _instancia = DipFireBase._privado();
  DipFireBase._privado();
  //Constructor prvado. Se va a instanciar una vez, para que no se conecte a la base de datos múltiples veces
  //Inicializar una lista que maneja el mapa de forma vacía
  //Si estamos usando modelos aquí se implementa
  factory DipFireBase() {
    //Implementa el constructor privado
    return _instancia;
  }
  //Lo anterior permite hacer un get a la instancia
  Future<List<Map<String, dynamic>>> get conceptos async {
    //Esto hace que el método sea asíncrono, para que reciba una petición y que devuelva la información que necesito
    List<Map<String, dynamic>> conceptos = [];
    final respuesta =
        await http.get("https://dipdb-b97db.firebaseio.com/conceptos.json");
    print("json: ${respuesta.body}");
    Map<String, dynamic> datos = json.decode(respuesta.body);
    print("map: $datos");
      datos.forEach((indice, contenido) {
      contenido['id'] = indice;
      conceptos.add(contenido);
    });
    print("lista:  conceptos");
    return conceptos;
  }

  Future<bool> agregarConcepto(Map<String, dynamic> nuevoConcepto) async {
    final respuesta = await http.post(
        "https://dipdb-b97db.firebaseio.com/conceptos.json",
        body: json.encode(nuevoConcepto));
    return true;
  }

  Future<bool> editarConcepto(Map<String, dynamic> nuevoConcepto) async {
    final respuesta = await http.put(
        "https://dipdb-b97db.firebaseio.com/conceptos/${nuevoConcepto['id']}.json",
        body: json.encode(nuevoConcepto));
    return true;
  }

  Future<bool> eliminarConcepto(Map<String, dynamic> concepto) async {
    final respuesta = await http.delete(
        "https://dipdb-b97db.firebaseio.com/conceptos/${concepto['id']}.json");
    return true;
  }

  Future<bool> tipoConcepto(Map<String, dynamic> concepto) async {
    final respuesta = await http.put(
        "https://dipdb-b97db.firebaseio.com/conceptos/${concepto['id']}/tipo.json",
        body: json.encode(true));
    return true;
  }

  Future<List<Map<String, dynamic>>> get diccionarios async {
    //Esto hace que el método sea asíncrono, para que reciba una petición y que devuelva la información que necesito
    List<Map<String, dynamic>> diccionarios = [];
    final respuesta =
        await http.get("https://dipdb-b97db.firebaseio.com/diccionarios.json");
    print("json: ${respuesta.body}");
    Map<String, dynamic> datos = json.decode(respuesta.body);
    print("map: $datos");
      datos.forEach((indice, contenido) {
      contenido['id'] = indice;
      diccionarios.add(contenido);
    });
    print("lista:  diccionarios");
    return diccionarios;
  }

  Future<bool> agregarDiccionario(Map<String, dynamic> nuevoDiccionario) async {
    final respuesta = await http.post(
        "https://dipdb-b97db.firebaseio.com/diccionarios.json",
        body: json.encode(nuevoDiccionario));
    return true;
  }

  Future<bool> editarDiccionario(Map<String, dynamic> nuevoDiccionario) async {
    final respuesta = await http.put(
        "https://dipdb-b97db.firebaseio.com/diccionarios/${nuevoDiccionario['id']}.json",
        body: json.encode(nuevoDiccionario));
    return true;
  }

  Future<bool> eliminarDiccionario(Map<String, dynamic> diccionario) async {
    final respuesta = await http.delete(
        "https://dipdb-b97db.firebaseio.com/diccionarios/${diccionario['id']}.json");
    return true;
  }
}
