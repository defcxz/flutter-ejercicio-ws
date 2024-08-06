import 'package:flutter/material.dart';
import 'package:flutter20240801_1/modelos/Producto.dart';
import 'package:flutter20240801_1/widgets/widget_producto_formulario.dart';

class PaginaProductoInsertar extends StatefulWidget {
  const PaginaProductoInsertar({Key? key}) : super(key: key);

  @override
  _PaginaProductoInsertarState createState() =>
      _PaginaProductoInsertarState();
}

class _PaginaProductoInsertarState extends State<PaginaProductoInsertar> {
  Producto producto=Producto(idProduct: 0, name: "", idProductCategory: 0, price: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Insertar Producto"),),
      body: WidgetProductoFormulario(producto),
    );
  }
}
