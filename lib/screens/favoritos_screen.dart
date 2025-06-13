import 'package:flutter/material.dart';
import 'detalle_screen.dart';

class FavoritosScreen extends StatelessWidget {
  final List<Map<String, dynamic>> clases;
  final Function(Map<String, dynamic>) onUpdate;

  FavoritosScreen({
    required this.clases,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    final favoritas = clases.where((c) => c['isReserved'] == true || c['isFavorite'] == true).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Clases Favoritas o Reservadas')),
      body: favoritas.isEmpty
          ? Center(child: Text('No hay clases favoritas o reservadas.'))
          : ListView.builder(
              itemCount: favoritas.length,
              itemBuilder: (context, index) {
                final clase = favoritas[index];
                return ListTile(
                  leading: Image.asset(clase['instrumentIconUrl'], width: 50),
                  title: Text(clase['instrument']),
                  subtitle: Text(clase['schedule']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetalleScreen(
                          classItem: clase,
                          onUpdate: onUpdate,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}