import 'package:flutter/material.dart';
import 'package:reserva_musica_flutter/screens/catalogo_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/catalogo',
      routes: {
        // '/': (context) => const SplashScreen(),
        '/catalogo': (context) => const CatalogoScreen(),
        // '/favoritos': (context) => const FavoritosScreen(),
      },
    );
  }
}
