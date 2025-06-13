import 'package:flutter/material.dart';
import 'catalogo_screen.dart';

class ConfirmacionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Confirmación')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, color: Colors.green, size: 100),
            SizedBox(height: 20),
            Text(
              '¡Clase reservada correctamente!',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => CatalogoScreen()),
                  (route) => false,
                );
              },
              child: Text('Volver al catálogo'),
            ),
          ],
        ),
      ),
    );
  }
}