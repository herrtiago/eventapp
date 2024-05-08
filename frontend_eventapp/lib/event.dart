import 'users.dart'; 

class Evento {
  final int id;
  final String nombre;
  final String content;
  final bool publicado;
  final int likes;
  final DateTime createdAt;
  final DateTime fecha;
  final String tipo;
  final String ubicacion;
  final String tags;
  final Usuario autor;
  final String imageUrl;

  Evento({
    required this.id,
    required this.nombre,
    required this.content,
    required this.publicado,
    required this.likes,
    required this.createdAt,
    required this.fecha,
    required this.tipo,
    required this.ubicacion,
    required this.tags,
    required this.autor,
    required this.imageUrl,
  });

  factory Evento.fromJson(Map<String, dynamic> json) {
    return Evento(
      id: json['id'],
      nombre: json['title'],
      content: json['content'],
      publicado: json['published'],
      likes: json['likes'],
      createdAt: DateTime.parse(json['created_at']),
      fecha: DateTime.parse(json['datetime']),
      tipo: json['type_event'],
      ubicacion: json['location'],
      tags: json['tags'],
      autor: Usuario.fromJson(json['author']),
      imageUrl: json['image'],
    );
  }
}
