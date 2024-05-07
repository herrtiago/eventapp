import 'package:flutter/material.dart';
import 'top_bar.dart'; 
import 'bottom_bar.dart';
import 'event_card.dart';
import 'dart:convert'; 
import 'package:http/http.dart' as http;

Future<List<Evento>> fetchEventos() async {
  final response = await http.get(Uri.parse('http://20.163.25.147:8000/newpost'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((eventoJson) => Evento.fromJson(eventoJson)).toList();
  } else {
    throw Exception('Error al cargar los eventos');
  }
}

class Evento {
  final String nombre;
  final String ubicacion;
  final String descripcion;
  final String fecha;
  final String tipo;
  final String imageUrl; // Nueva propiedad para la URL de la imagen

  Evento({
    required this.nombre,
    required this.ubicacion,
    required this.descripcion,
    required this.fecha,
    required this.tipo,
    required this.imageUrl,
  });

  factory Evento.fromJson(Map<String, dynamic> json) {
    return Evento(
      nombre: json['nombre'],
      ubicacion: json['ubicacion'],
      descripcion: json['descripcion'],
      fecha: json['fecha'],
      tipo: json['tipo'],
      imageUrl: json['imageUrl'], // Asignación de la URL de la imagen desde el JSON
    );
  }
}

class HomePage extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    color: const Color.fromARGB(255, 86, 86, 86),
    fontSize: 17,
    fontWeight: FontWeight.bold,
    fontFamily: 'Karla',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarView(),
      body: FutureBuilder<List<Evento>>(
        future: fetchEventos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final evento = snapshot.data![index];
                return EventCard(
                  eventName: evento.nombre,
                  date: evento.fecha,
                  time: '00:00', // Aquí puedes proporcionar la hora si está disponible
                  imageUrl: evento.imageUrl, // Pasamos la URL de la imagen desde el evento
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomBarView(),
    );
  }
}
