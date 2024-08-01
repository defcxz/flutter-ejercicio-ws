import 'package:flutter/material.dart';

import '../modelos/Usuario.dart';

class WidgetUsuarioListar extends StatefulWidget {
  List<Usuario> usuarios;
  WidgetUsuarioListar(this.usuarios,{Key? key}) : super(key: key);

  @override
  _WidgetUsuarioListarState createState() => _WidgetUsuarioListarState();
}

class _WidgetUsuarioListarState extends State<WidgetUsuarioListar> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext context,int fila) {
          return Card(
            child: ListTile(
              title: Text("${widget.usuarios[fila].userName}"),
            ),
          );
      },
      itemCount: widget.usuarios.length,
    );
  }
}
