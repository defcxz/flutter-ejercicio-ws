import 'package:flutter/material.dart';
import 'package:flutter20240801_1/modelos/Producto.dart';
import 'package:flutter20240801_1/servicios/producto_srv.dart';

class WidgetProductoFormulario extends StatefulWidget {
  Producto producto;
  WidgetProductoFormulario(this.producto,{Key? key}) : super(key: key);

  @override
  _WidgetProductoFormularioState createState() =>
      _WidgetProductoFormularioState();
}

class _WidgetProductoFormularioState extends State<WidgetProductoFormulario> {
  TextEditingController idProductController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController idProductCategoryController=TextEditingController();

  @override
  void initState() {
    super.initState();
    idProductController.text=widget.producto.idProduct.toString();
    idProductController.addListener(() {
      widget.producto.idProduct=int.parse(idProductController.text);
    });
    nameController.text=widget.producto.name??"";
    nameController.addListener(() {
      widget.producto.name=nameController.text;
    });
    priceController.text=widget.producto.price??"";
    priceController.addListener(() {
      widget.producto.price=priceController.text;
    });
    idProductCategoryController.text=widget.producto.idProductCategory.toString();
    idProductCategoryController.addListener(() {
      widget.producto.idProductCategory=int.parse(idProductCategoryController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(controller: idProductController,),
        TextField(controller: nameController,),
        TextField(controller: priceController,),
        TextField(controller: idProductCategoryController,),
        ElevatedButton(onPressed: () async {
          int num=await ProductoSrv.agregarProducto(widget.producto);
          Navigator.pop(context);

        }, child:Text("Insertar"))
      ],
    );
  }
}
