import 'package:flutter/material.dart';

class MensajePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mensaje Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('Hola Mundo'),
      ),
    );
  }
}
