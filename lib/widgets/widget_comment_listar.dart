import 'package:flutter/material.dart';

import '../modelos/Comment.dart';

class WidgetCommentListar extends StatefulWidget {
  final List<Comment> comments;

  WidgetCommentListar(this.comments, {Key? key}) : super(key: key);

  @override
  _WidgetCommentListarState createState() => _WidgetCommentListarState();
}

class _WidgetCommentListarState extends State<WidgetCommentListar> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext contexto, int fila) {
        return Card(
          child: ListTile(
            title: Text("${widget.comments[fila].commentary}"),
            subtitle: Text("${widget.comments[fila].userName}"),
            leading: Text("${widget.comments[fila].idComment}"),
            trailing: Text("${widget.comments[fila].idRoom}"),
          ),
        );
      },
      itemCount: widget.comments.length,
    );
  }
}
