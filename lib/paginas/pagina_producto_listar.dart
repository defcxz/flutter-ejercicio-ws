import 'package:flutter/material.dart';
import 'package:flutter20240801_1/paginas/pagina_producto_insertar.dart';
import 'package:flutter20240801_1/servicios/producto_srv.dart';
import 'package:flutter20240801_1/widgets/widget_producto_listar.dart';

import '../modelos/Producto.dart';

class PaginaProductoListar extends StatefulWidget {
  const PaginaProductoListar({Key? key}) : super(key: key);

  @override
  _PaginaProductoListarState createState() =>
      _PaginaProductoListarState();
}

class _PaginaProductoListarState
    extends State<PaginaProductoListar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:ElevatedButton(
        onPressed: () {
        Navigator
            .push(
            context,
            MaterialPageRoute(builder: (context) => PaginaProductoInsertar())
        ).then((dynamic valor) {
          setState(() {
            // actualiza la pagina
          });
        });
      },child: Text("Agregar"),),
      appBar: AppBar(
        title: Text("Listar categorias productos"),
      ),
      body: StreamBuilder(
        stream: ProductoSrv.obtenerListadoStream(),
        builder: (BuildContext context,AsyncSnapshot<List<Producto>> snap) {
          if(snap.hasData) {
            return WidgetProductoListar(snap.requireData);
          } else {
            return Text("sin datos");
          }
        },
      ),
    );
  }
}
