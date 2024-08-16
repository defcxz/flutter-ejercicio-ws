import '../modelos/Comment.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class CommentSrv {
  static Future<List<Comment>> obtenerListado() async {
    var url =  Uri.https('seg.cl', '/api/Comment/listall', {});
    // (con el metodo get)
    //await Future.delayed(Duration(seconds: 3));
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // obtengo una lista de dinamico
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      List<Comment> resultados=jsonResponse.map((comment)=>Comment.fromJson(comment)).toList();
      return resultados;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return [];
  }
  static Stream<List<Comment>> obtenerListadoStream() async* {
    var url =  Uri.https('seg.cl', '/api/Comment/listall', {});
    // (con el metodo get)
    //await Future.delayed(Duration(seconds: 3));
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // obtengo una lista de dinamico
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      List<Comment> resultados=jsonResponse.map((comment)=>Comment.fromJson(comment)).toList();
      yield resultados;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      yield [];
    }
  }

  static Future<int> agregarComment(Comment comment) async {
    var url =  Uri.https('seg.cl', '/api/Comment/insert', {});
    var mapa=comment.toJson();
    var json=convert.jsonEncode(mapa);

    var response = await http.post(url,body: json);
    if (response.statusCode == 200) {
      var respuesta = int.parse(response.body);
      return respuesta;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return -1;
    }
  }
}