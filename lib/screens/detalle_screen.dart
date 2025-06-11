import 'package:flutter/material.dart';

class DetalleScreen extends StatefulWidget {
  final Map<String, dynamic> classItem;

  const DetalleScreen({super.key, required this.classItem});

  @override
  State<DetalleScreen> createState() => _DetalleScreenState();
}

class _DetalleScreenState extends State<DetalleScreen> {
  late bool isReserved;
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isReserved = widget.classItem['isReserved'] ?? false;
    isFavorite = widget.classItem['isFavorite'] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text(widget.classItem['instrument'] ?? 'Detalle'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              widget.classItem['instrumentImageUrl'],
              height: 200,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.music_note, size: 200),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage(widget.classItem['teacherImageUrl']),
              ),
              title: Text('Profesor: ${widget.classItem['teacher']}', 
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Horario: ${widget.classItem['schedule']}'),
            ),
            const SizedBox(height: 12),
            Text(
              widget.classItem['description'],
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isReserved ? Colors.red : Colors.green,
                    ),
                    onPressed: () {
                      setState(() {
                        isReserved = !isReserved;
                      });
                    },
                    child: Text(isReserved ? 'Cancelar reserva' : 'Reservar', 
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  tooltip: 'Agregar a favoritos',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
