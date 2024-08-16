import 'package:flutter/material.dart';

class WidgetCargando extends StatefulWidget {
  const WidgetCargando({Key? key}) : super(key: key);

  @override
  _WidgetCargandoState createState() => _WidgetCargandoState();
}

class _WidgetCargandoState extends State<WidgetCargando> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Cargando....",
            textAlign: TextAlign.center,
          ),
          Icon(Icons.cloud_download)
        ],
      ),
    );
  }
}
