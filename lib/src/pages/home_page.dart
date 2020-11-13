import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/producto_provider.dart';

class HomePage extends StatelessWidget {
  // final productosProvider = new ProductosProvider();
  @override
  Widget build(BuildContext context) {
    final productosBloc = Provider.productosBloc(context);
    productosBloc.cargarProductos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: _crearListado(productosBloc),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado(ProductoBloc productosBloc) {
    return StreamBuilder(
      stream: productosBloc.productoStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (BuildContext context, int index) {
              return _crearItem(context, productos[index], productosBloc);
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductoModel producto,
      ProductoBloc productosBloc) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        productosBloc.borrarProducto(producto.id);
      },
      background: Container(
        color: Colors.red,
      ),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          width: 50,
          child: (producto.fotoUrl == null)
              ? Image(image: AssetImage('assets/no-image.png'))
              : FadeInImage(
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage(producto.fotoUrl)),
        ),
        title: Text('${producto.titulo} - ${producto.valor}'),
        subtitle: Text(producto.id),
        onTap: () =>
            Navigator.pushNamed(context, 'producto', arguments: producto),
      ),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, 'producto'));
  }
}
