import 'package:flutter/material.dart';
import 'package:flutter20240801_1/modelos/ProductoCategoria.dart';
import 'package:flutter20240801_1/servicios/producto_categoria_srv.dart';

class WidgetProductoCategoriaFormulario extends StatefulWidget {
  ProductoCategory productoCategory;
  WidgetProductoCategoriaFormulario(this.productoCategory,{Key? key}) : super(key: key);

  @override
  _WidgetProductoCategoriaFormularioState createState() =>
      _WidgetProductoCategoriaFormularioState();
}

class _WidgetProductoCategoriaFormularioState extends State<WidgetProductoCategoriaFormulario> {
  TextEditingController idProductCategoryController=TextEditingController();
  TextEditingController nameController=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idProductCategoryController.text=widget.productoCategory.idProductCategory.toString();
    idProductCategoryController.addListener(() {
      widget.productoCategory.idProductCategory=int.parse(idProductCategoryController.text);
    });
    nameController.text=widget.productoCategory.name??"";
    nameController.addListener(() {
      widget.productoCategory.name=nameController.text;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(controller: idProductCategoryController,),
        TextField(controller: nameController,),
        ElevatedButton(onPressed: () async {
          int num=await ProductoCategoriaSrv.agregarProductoCategory(widget.productoCategory);
          Navigator.pop(context);

        }, child:Text("Insertar"))
      ],
    );
  }
}
