import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String eventName;
  final String date;
  final String time;
  final String imageUrl;

  const EventCard({
    Key? key,
    required this.eventName,
    required this.date,
    required this.time,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(imageUrl), // Aquí puedes cargar la imagen desde la URL
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.black.withOpacity(0.5), // Fondo oscuro transparente
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        eventName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '$date - $time',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Lógica para ver el evento
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Ver'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
