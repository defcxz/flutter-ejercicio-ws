import 'package:flutter/material.dart';
import 'package:flutter20240801_1/paginas/pagina_producto_categoria_insertar.dart';
import 'package:flutter20240801_1/paginas/pagina_producto_categoria_listar.dart';
import 'package:flutter20240801_1/paginas/pagina_usuario_listar.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PaginaProductoCategoriaListar(),
    );
  }
}

