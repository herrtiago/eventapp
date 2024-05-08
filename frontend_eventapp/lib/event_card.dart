import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String eventName;
  final String date;
  final String location; // Cambiar el nombre de la variable de "time" a "location"
  final String imageUrl;

  const EventCard({
    required this.eventName,
    required this.date,
    required this.location, // Cambiar el nombre de la variable de "time" a "location"
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15), // Espacio entre las tarjetas
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), 
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 2), 
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16), // Ajusta el espacio interno
              decoration: BoxDecoration(
                color: Color.fromARGB(200, 255, 255, 255), // Fondo blanco para la segunda columna interna
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)), // Redondear bordes inferiores
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 15), 
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fecha: $date',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              'Ubicación: $location', 
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10), // Espacio entre las columnas
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/event_page');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 77, 127, 158), 
                        ),
                        child: Text(
                          'Ver evento',
                          style: TextStyle(color: Colors.white), 
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
