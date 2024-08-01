import 'package:flutter/material.dart';
import 'package:flutter20240801_1/servicios/UsuarioSrv.dart';
import 'package:flutter20240801_1/widgets/widget_cargando.dart';
import 'package:flutter20240801_1/widgets/widget_usuario_listar.dart';

import '../modelos/Usuario.dart';

class PaginaUsuarioListar extends StatefulWidget {
  const PaginaUsuarioListar({Key? key}) : super(key: key);

  @override
  _PaginaUsuarioListarState createState() => _PaginaUsuarioListarState();
}

class _PaginaUsuarioListarState extends State<PaginaUsuarioListar> {
  @override
  initState() {
    super.initState();
    cargaInicial();
  }

  cargaInicial() async {
    //  usuarios=await Usuariosrv.obtenerListado();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("listar usuarios"),
      ),
      body: StreamBuilder(
        stream: Usuariosrv.obtenerListadoStream(),
        builder: (BuildContext contexto, AsyncSnapshot<List<Usuario>> snap) {
          // cuando esta cargando
          if (snap.connectionState == ConnectionState.waiting) {
            return WidgetCargando();
          } else {
            if (snap.connectionState == ConnectionState.done) {
              return WidgetUsuarioListar(snap.requireData);
            }
          }
          if (snap.hasError) {
            return Text("hay un error");
            // mostrar un error
          }
          if (!snap.hasData) {
            // mostrar sin datos;
          }
          return Text("????");
        },
      ),
    );
  }
}
