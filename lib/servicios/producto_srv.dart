import 'package:flutter20240801_1/modelos/Producto.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ProductoSrv {
  static Stream<List<Producto>> obtenerListadoStream() async* {
    var url =  Uri.https('seg.cl', '/api/Product/listall', {});
    // (con el metodo get)
    //await Future.delayed(Duration(seconds: 3));
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // obtengo una lista de dinamico
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      // cada objeto dinamico dento de la lista, lo transformo en un objeto del usuario usuario
      List<Producto> resultados=jsonResponse.map((usuario)=>Producto.fromJson(usuario)).toList();
      yield resultados;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      yield [];
    }
  }
  static Future<int> agregarProducto(Producto prod) async {
    var url =  Uri.https('seg.cl', '/api/Product/insert', {});
    var mapa=prod.toJson();
    var json=convert.jsonEncode(mapa);

    var response = await http.post(url,body: json);
    if (response.statusCode == 200) {
      // obtengo una lista de dinamico
      var respuesta = int.parse(response.body);
      return respuesta;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return -1;
    }
  }
}