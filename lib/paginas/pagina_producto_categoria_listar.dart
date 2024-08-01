import 'package:flutter/material.dart';
import 'package:flutter20240801_1/paginas/pagina_producto_categoria_insertar.dart';
import 'package:flutter20240801_1/servicios/producto_categoria_srv.dart';
import 'package:flutter20240801_1/widgets/widget_producto_categoria_listar.dart';

import '../modelos/ProductoCategoria.dart';

class PaginaProductoCategoriaListar extends StatefulWidget {
  const PaginaProductoCategoriaListar({Key? key}) : super(key: key);

  @override
  _PaginaProductoCategoriaListarState createState() =>
      _PaginaProductoCategoriaListarState();
}

class _PaginaProductoCategoriaListarState
    extends State<PaginaProductoCategoriaListar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:ElevatedButton(
        onPressed: () {
        Navigator
            .push(
            context,
            MaterialPageRoute(builder: (context) => PaginaProductoCategoriaInsertar())
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
        stream: ProductoCategoriaSrv.obtenerListadoStream(),
        builder: (BuildContext context,AsyncSnapshot<List<ProductoCategory>> snap) {
          if(snap.hasData) {
            return WidgetProductoCategoriaListar(snap.requireData);
          } else {
            return Text("sin datos");
          }
        },
      ),
    );
  }
}
