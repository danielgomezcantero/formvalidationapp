import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/pages/home_page.dart';
import 'package:formvalidation/src/pages/login_page.dart';
import 'package:formvalidation/src/pages/producto_page.dart';
import 'package:formvalidation/src/pages/registro_page.dart';
import 'package:formvalidation/src/preferencias_usuario/preferencias_usuario.dart';

void main() async {
  final prefs = new PreferenciasUsuario();
  WidgetsFlutterBinding.ensureInitialized();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': (context) => LoginPage(),
          'registro': (context) => RegistroPage(),
          'home': (context) => HomePage(),
          'producto': (context) => ProductoPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
