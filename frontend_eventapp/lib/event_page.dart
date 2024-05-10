import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic>? args =
      ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (args == null) {
      throw Exception("Los argumentos son nulos");
    }

    final String eventName = args['eventName'];
    final String date = args['date'];
    final String location = args['location'];
    final String content = args['content'];
    final Map<String, dynamic> author = args['author'];
    final String imageUrl = args['imageUrl'];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(width: 5),
                      Text(date),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 5),
                      Text(location),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Información',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(content),
                  SizedBox(height: 10),
                  Text(
                    'Organizador',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(author['username']), // Mostrar el nombre de usuario del autor
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Acción al presionar el botón
                      },
                      icon: Icon(Icons.add),
                      label: Text('Unirse'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

