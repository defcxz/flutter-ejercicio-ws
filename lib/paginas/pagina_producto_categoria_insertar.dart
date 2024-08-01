import 'package:flutter/material.dart';
import 'package:flutter20240801_1/modelos/ProductoCategoria.dart';
import 'package:flutter20240801_1/widgets/widget_producto_categoria_formulario.dart';

class PaginaProductoCategoriaInsertar extends StatefulWidget {
  const PaginaProductoCategoriaInsertar({Key? key}) : super(key: key);

  @override
  _PaginaProductoCategoriaInsertarState createState() =>
      _PaginaProductoCategoriaInsertarState();
}

class _PaginaProductoCategoriaInsertarState extends State<PaginaProductoCategoriaInsertar> {
  ProductoCategory productoCategory=ProductoCategory(name: "",idProductCategory: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Insertar producto categoria"),),
      body: WidgetProductoCategoriaFormulario(productoCategory),
    );
  }
}
