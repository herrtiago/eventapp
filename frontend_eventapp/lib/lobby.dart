import 'package:flutter/material.dart';

class LobbyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: [
            SizedBox(
              height: 200, 
              child: Padding(
                padding: const EdgeInsets.all(20), 
                child: Image.asset(
                  'images/logo.png', 
                  fit: BoxFit.contain, 
                ),
              ),
            ),
            const SizedBox(height:-0), 
            Center(
              child: const Text(
                'DESCUBRE NUEVOS EVENTOS',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 230), 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: GestureDetector(
                // Para detectar los toques en el texto
                onTap: () {
                  Navigator.pushNamed(context, '/politicas');
                },
                child: const Text(
                  'Al registrarte, aceptas nuestros Términos y Políticas de privacidad',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
            const SizedBox(height: 30), 
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 77, 127, 158), 
              ),
              child: const Text('INICIAR SESIÓN'),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 217, 104, 38),
              ),
              child: const Text('REGISTRARSE'),
            ),
          ],
        ),
      ),
    );
  }
}
