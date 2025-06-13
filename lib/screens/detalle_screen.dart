import 'package:flutter/material.dart';

class DetalleScreen extends StatefulWidget {
  final Map<String, dynamic> classItem;
  final Function(Map<String, dynamic>) onUpdate;

  DetalleScreen({
    required this.classItem,
    required this.onUpdate,
  });

  @override
  State<DetalleScreen> createState() => _DetalleScreenState();
}

class _DetalleScreenState extends State<DetalleScreen> {
  late Map<String, dynamic> clase;

  @override
  void initState() {
    super.initState();
    clase = Map<String, dynamic>.from(widget.classItem);
  }

  void toggleReserva() {
    setState(() {
      clase['isReserved'] = !clase['isReserved'];
    });
    widget.onUpdate(clase);
  }

  void toggleFavorito() {
    setState(() {
      clase['isFavorite'] = !clase['isFavorite'];
    });
    widget.onUpdate(clase);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(clase['instrument'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset(clase['instrumentImageUrl'], height: 200),
            const SizedBox(height: 16),
            Text(clase['description']),
            const SizedBox(height: 16),
            Text('Horario: ${clase['schedule']}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: toggleReserva,
              child: Text(
                clase['isReserved'] ? 'Cancelar Reserva' : 'Reservar Clase',
              ),
            ),
            ElevatedButton(
              onPressed: toggleFavorito,
              child: Text(
                clase['isFavorite'] ? 'Quitar de Favoritos' : 'Agregar a Favoritos',
              ),
            ),
          ],
        ),
      ),
    );
  }
}