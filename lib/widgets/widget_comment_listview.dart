import 'package:flutter/material.dart';
import 'package:flutter20240801_1/widgets/widget_comment_listar.dart';
import 'package:flutter20240801_1/servicios/CommentSrv.dart';

import '../modelos/Comment.dart';

class WidgetCommentListview extends StatefulWidget {
  const WidgetCommentListview({Key? key}) : super(key: key);

  @override
  _WidgetCommentListviewState createState() => _WidgetCommentListviewState();
}

class _WidgetCommentListviewState extends State<WidgetCommentListview> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: CommentSrv.obtenerListadoStream(),
      builder: (BuildContext context,AsyncSnapshot<List<Comment>> snap) {
        if(snap.hasData) {
          return ListView.builder(
              itemBuilder:
                  (BuildContext context, int fila) {
              return WidgetCommentListar(snap.data![fila] as List<Comment>);
          },
          itemCount: snap.data!.length,
          );
        }
        return Container();
      },
    );
  }
}
