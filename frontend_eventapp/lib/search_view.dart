import 'package:flutter/material.dart';

class BuscarView extends StatelessWidget {
  const BuscarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar por nombre de evento',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                // Implementa la lógica de búsqueda aquí
              },
            ),
            // Puedes agregar aquí cualquier otro widget relacionado con la búsqueda
          ],
        ),
      ),
    );
  }
}
