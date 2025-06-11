
import 'package:flutter/material.dart';

class PantallaRegistro extends StatefulWidget {
  @override
  _PantallaRegistroState createState() => _PantallaRegistroState();
}

class _PantallaRegistroState extends State<PantallaRegistro> {
  final controladorUsuario = TextEditingController();
  final controladorCorreo = TextEditingController();
  final controladorContrasena = TextEditingController();
  final controladorConfirmar = TextEditingController();

  @override
  void dispose() {
    controladorUsuario.dispose();
    controladorCorreo.dispose();
    controladorContrasena.dispose();
    controladorConfirmar.dispose();
    super.dispose();
  }

  void registrarUsuario() {
    String usuario = controladorUsuario.text;
    String correo = controladorCorreo.text;
    String contrasena = controladorContrasena.text;
    String confirmar = controladorConfirmar.text;

    if (usuario.isEmpty ||
        correo.isEmpty ||
        contrasena.isEmpty ||
        confirmar.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Todos los campos son obligatorios')),
      );
    } else if (contrasena != confirmar) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Las contraseñas no coinciden')),
      );
    } else {
      // Simulación de registro exitoso
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Registro exitoso'),
          content: Text('Bienvenido, $usuario'),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.popUntil(context, (route) => route.isFirst),
              child: Text('Volver al inicio'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Registro de Usuario'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            TextField(
              controller: controladorUsuario,
              decoration: InputDecoration(labelText: 'Nombre de usuario'),
            ),
            TextField(
              controller: controladorCorreo,
              decoration: InputDecoration(labelText: 'Correo electrónico'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: controladorContrasena,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            TextField(
              controller: controladorConfirmar,
              decoration: InputDecoration(labelText: 'Confirmar contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: registrarUsuario,
              child: Text('Registrarse'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
