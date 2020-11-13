import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/login_bloc.dart';
import 'package:formvalidation/src/bloc/productos_bloc.dart';
export 'package:formvalidation/src/bloc/login_bloc.dart';
export 'package:formvalidation/src/bloc/productos_bloc.dart';

class Provider extends InheritedWidget {
  static Provider _instancia;
  final loginBloc = LoginBloc();
  final _productoBloc = ProductoBloc();

  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }
    return _instancia;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc);
  }

  static ProductoBloc productosBloc(BuildContext context) {
    return (context
        .dependOnInheritedWidgetOfExactType<Provider>()
        ._productoBloc);
  }
}
