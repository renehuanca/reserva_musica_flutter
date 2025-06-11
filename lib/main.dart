import 'package:flutter/material.dart';
import 'pantalla_bienvenida.dart';

void main() {
  runApp(ReservaMusicaApp());
}

class ReservaMusicaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReservaMúsica',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/',
      routes: {
        '/': (context) => PantallaBienvenida(),
        /*'/inicio-sesion': (context) => PantallaInicioSesion(),
        '/registro': (context) => PantallaRegistro(),*/
      },
    );
  }
}
