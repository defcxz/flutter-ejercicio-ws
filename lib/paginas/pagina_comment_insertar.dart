import 'package:flutter/material.dart';
import 'package:flutter20240801_1/modelos/Comment.dart';
import 'package:flutter20240801_1/widgets/widget_comment_formulario.dart';

class PaginaCommentInsertar extends StatefulWidget {
  const PaginaCommentInsertar({Key? key}) : super(key: key);

  @override
  _PaginaCommentInsertarState createState() =>
      _PaginaCommentInsertarState();
}

class _PaginaCommentInsertarState extends State<PaginaCommentInsertar> {
  Comment comment = Comment(
      idComment: 0,
      userName: "usuario",
      commentary: "Comentario de prueba",
      idRoom: 1
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Insertar Comentario"),),
      body: WidgetCommentFormulario(comment),
    );
  }
}
