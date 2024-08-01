import '../modelos/Usuario.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Usuariosrv {
  static Future<List<Usuario>> obtenerListado() async {
    //https://seg.cl/api/User/listall
    var url =  Uri.https('seg.cl', '/api/User/listall', {});
    // (con el metodo get)
    //await Future.delayed(Duration(seconds: 3));
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // obtengo una lista de dinamico
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      // cada objeto dinamico dento de la lista, lo transformo en un objeto del usuario usuario
      List<Usuario> resultados=jsonResponse.map((usuario)=>Usuario.fromJson(usuario)).toList();
      return resultados;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return [];
  }
  static Stream<List<Usuario>> obtenerListadoStream() async* {
    //https://seg.cl/api/User/listall
    var url =  Uri.https('seg.cl', '/api/User/listall', {});
    // (con el metodo get)
    //await Future.delayed(Duration(seconds: 3));
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // obtengo una lista de dinamico
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      // cada objeto dinamico dento de la lista, lo transformo en un objeto del usuario usuario
      List<Usuario> resultados=jsonResponse.map((usuario)=>Usuario.fromJson(usuario)).toList();
      yield resultados;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      yield [];
    }
  }
}