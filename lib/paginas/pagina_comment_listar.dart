import 'package:flutter/material.dart';
import 'package:flutter20240801_1/paginas/pagina_comment_insertar.dart';
import 'package:flutter20240801_1/servicios/CommentSrv.dart';

import '../modelos/Comment.dart';
import '../widgets/widget_comment_listar.dart';

class PaginaCommentListar extends StatefulWidget {
  const PaginaCommentListar({Key? key}) : super(key: key);

  @override
  _PaginaCommentListarState createState() =>
      _PaginaCommentListarState();
}

class _PaginaCommentListarState
    extends State<PaginaCommentListar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        onPressed: () {
        Navigator
            .push(
            context,
            MaterialPageRoute(builder: (context) => const PaginaCommentInsertar())
        ).then((dynamic valor) {
          setState(() {
            // actualiza la pagina
          });
        });
      },child: const Icon(Icons.add),),
      appBar: AppBar(
        title: const Text("Listar de Comentarios"),
      ),
      body: StreamBuilder(
        stream: CommentSrv.obtenerListadoStream(),
        builder: (BuildContext context,AsyncSnapshot<List<Comment>> snap) {
          if(snap.hasData) {
            return WidgetCommentListar(snap.requireData);
          } else {
            return const Text("Sin datos");
          }
        },
      ),
    );
  }
}