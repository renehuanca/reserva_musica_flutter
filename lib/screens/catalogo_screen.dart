import 'package:flutter/material.dart';
import 'package:reserva_musica_flutter/screens/detalle_screen.dart';

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  final TextEditingController searchController = TextEditingController();
  static final List<Map<String, dynamic>> classList = [
    {
      'id': 1,
      'instrument': 'Acordeón',
      'teacher': 'Luis Ortega',
      'schedule': 'Lunes 14:00 - 16:00',
      'description':
          'Aprende a tocar el acordeón desde las bases con ejercicios prácticos y repertorio folclórico tradicional. Ideal para principiantes.',
      'instrumentImageUrl': 'assets/images/acordeon.png',
      'instrumentIconUrl': 'assets/images/acordeon-icon.png',
      'teacherImageUrl': 'assets/images/prof-1.png',
      'isReserved': false,
      'isFavorite': false,
    },
    {
      'id': 2,
      'instrument': 'Saxofón',
      'teacher': 'Elena Gutiérrez',
      'schedule': 'Martes 09:00 - 11:00',
      'description':
          'Curso completo de saxofón centrado en técnica de respiración, lectura musical y ejecución de piezas de jazz y blues.',
      'instrumentImageUrl': 'assets/images/saxofon.png',
      'instrumentIconUrl': 'assets/images/saxofon-icon.png',
      'teacherImageUrl': 'assets/images/prof-2.png',
      'isReserved': true,
      'isFavorite': false,
    },
    {
      'id': 3,
      'instrument': 'Trompeta',
      'teacher': 'Ricardo Fernández',
      'schedule': 'Miércoles 11:00 - 13:00',
      'description':
          'Entrena embocadura, técnica y repertorio clásico y moderno para dominar la trompeta desde el nivel inicial hasta avanzado.',
      'instrumentImageUrl': 'assets/images/trompeta.png',
      'instrumentIconUrl': 'assets/images/trompeta-icon.png',
      'teacherImageUrl': 'assets/images/prof-3.png',
      'isReserved': false,
      'isFavorite': false,
    },
    {
      'id': 4,
      'instrument': 'Violín',
      'teacher': 'Ana Torres',
      'schedule': 'Jueves 14:00 - 16:00',
      'description':
          'Explora técnica de arco, postura, afinación y repertorio clásico en este curso enfocado en el dominio del violín.',
      'instrumentImageUrl': 'assets/images/violin.png',
      'instrumentIconUrl': 'assets/images/violin-icon.png',
      'teacherImageUrl': 'assets/images/prof-4.png',
      'isReserved': false,
      'isFavorite': false,
    },
    {
      'id': 5,
      'instrument': 'Guitarra',
      'teacher': 'Carlos Pérez',
      'schedule': 'Viernes 15:00 - 17:00',
      'description':
          'Curso integral de guitarra con acordes, ritmos, escalas y canciones populares para todos los niveles.',
      'instrumentImageUrl': 'assets/images/guitarra.png',
      'instrumentIconUrl': 'assets/images/guitarra-icon.png',
      'teacherImageUrl': 'assets/images/prof-5.png',
      'isReserved': false,
      'isFavorite': false,
    },
    {
      'id': 6,
      'instrument': 'Piano',
      'teacher': 'María López',
      'schedule': 'Lunes 10:00 - 12:00',
      'description':
          'Clases de piano estructuradas en técnica, lectura de partituras y estilos desde el clásico hasta el moderno.',
      'instrumentImageUrl': 'assets/images/piano.png',
      'instrumentIconUrl': 'assets/images/piano-icon.png',
      'teacherImageUrl': 'assets/images/prof-6.png',
      'isReserved': false,
      'isFavorite': false,
    },
    {
      'id': 7,
      'instrument': 'Clarinete',
      'teacher': 'Lucía Rivas',
      'schedule': 'Miércoles 13:00 - 15:00',
      'description':
          'Desarrolla habilidades en clarinete con ejercicios de afinación, técnica y repertorio clásico contemporáneo.',
      'instrumentImageUrl': 'assets/images/clarinete.png',
      'instrumentIconUrl': 'assets/images/clarinete-icon.png',
      'teacherImageUrl': 'assets/images/prof-7.png',
      'isReserved': false,
      'isFavorite': false,
    },
    {
      'id': 8,
      'instrument': 'Batería',
      'teacher': 'Fernando Molina',
      'schedule': 'Viernes 16:00 - 18:00',
      'description':
          'Curso dinámico para aprender ritmos básicos, coordinación y técnica de batería en distintos estilos musicales.',
      'instrumentImageUrl': 'assets/images/bateria.png',
      'instrumentIconUrl': 'assets/images/bateria-icon.png',
      'teacherImageUrl': 'assets/images/prof-8.png',
      'isReserved': false,
      'isFavorite': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('Catálogo'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            tooltip: 'Clases Favoritas',
            onPressed: () {
              // Navigator.pushNamed(context, FavoritosScreen.routeName);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: 'Buscar clases...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) => {},
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(icon: Icon(Icons.search), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: classList.length,
              itemBuilder: (context, index) {
                final classItem = classList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              classItem['instrumentIconUrl'],
                              height: 80,
                              width: 80,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                classItem['instrument'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text('Profesor: ${classItem['teacher']}'),
                        Text('Horario: ${classItem['schedule']}'),
                        Text(
                          'Estado: ${classItem['isReserved'] ? 'Reservado' : 'Disponible'}',
                          style: TextStyle(
                            color:
                                classItem['isReserved']
                                    ? Colors.red
                                    : Colors.green,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.blue[400], // Cambia el color aquí
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          DetalleScreen(classItem: classItem),
                                ),
                              );
                            },
                            child: const Text('MÁS INFORMACIÓN', style: TextStyle(color: Colors.white,),)
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void masInformacion(int id) {}
}
