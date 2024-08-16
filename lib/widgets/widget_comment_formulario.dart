import 'package:flutter/material.dart';
import 'package:flutter20240801_1/modelos/Comment.dart';
import 'package:flutter20240801_1/servicios/CommentSrv.dart';

class WidgetCommentFormulario extends StatefulWidget {
  Comment comment;
  WidgetCommentFormulario(this.comment,{Key? key}) : super(key: key);

  @override
  _WidgetCommentFormularioState createState() =>
      _WidgetCommentFormularioState();
}

class _WidgetCommentFormularioState extends State<WidgetCommentFormulario> {
  TextEditingController idComment = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController commentary = TextEditingController();
  TextEditingController idRoom = TextEditingController();

  @override
  void initState() {
    super.initState();
    userName.text=widget.comment.userName!;
    userName.addListener(() {
      widget.comment.userName=userName.text;
    });
    commentary.text=widget.comment.commentary!;
    commentary.addListener(() {
      widget.comment.commentary=commentary.text;
    });
    idRoom.text=widget.comment.idRoom.toString();
    idRoom.addListener(() {
      widget.comment.idRoom=int.parse(idRoom.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(controller: idComment,decoration: InputDecoration(labelText: "Id"),)
        ,TextField(controller: userName,decoration: InputDecoration(labelText: "Usuario"),)
        ,TextField(controller: commentary,decoration: InputDecoration(labelText: "Comentario"),)
        ,TextField(controller: idRoom,decoration: InputDecoration(labelText: "IdRoom"),)
        ,ElevatedButton(onPressed: () async {
          await CommentSrv.agregarComment(widget.comment);
          Navigator.pop(context);

        }, child:Text("Insertar"))
      ],
    );
  }
}
