import 'package:flutter/material.dart';

import '../modelos/ProductoCategoria.dart';

class WidgetProductoCategoriaListar extends StatefulWidget {
  List<ProductoCategory> productoCategorias;
  WidgetProductoCategoriaListar(this.productoCategorias,{Key? key}) : super(key: key);

  @override
  _WidgetProductoCategoriaListarState createState() =>
      _WidgetProductoCategoriaListarState();
}

class _WidgetProductoCategoriaListarState
    extends State<WidgetProductoCategoriaListar> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext contexto, int fila) {
          return Card(
            child: ListTile(
              title: Text("${widget.productoCategorias[fila].name}"),
              leading: Card(child: Text("${widget.productoCategorias[fila].idProductCategory}"),),
            ),
          );
    },
      itemCount: widget.productoCategorias.length,
    );
  }
}
