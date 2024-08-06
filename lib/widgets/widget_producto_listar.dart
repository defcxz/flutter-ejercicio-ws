import 'package:flutter/material.dart';

import '../modelos/Producto.dart';

class WidgetProductoListar extends StatefulWidget {
  List<Producto> productos;
  WidgetProductoListar(this.productos,{Key? key}) : super(key: key);

  @override
  _WidgetProductoListarState createState() =>
      _WidgetProductoListarState();
}

class _WidgetProductoListarState
    extends State<WidgetProductoListar> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext contexto, int fila) {
          return Card(
            child: ListTile(
              title: Text("${widget.productos[fila].name}"),
              leading: Card(child: Text("${widget.productos[fila].idProductCategory}"),),
            ),
          );
    },
      itemCount: widget.productos.length,
    );
  }
}
