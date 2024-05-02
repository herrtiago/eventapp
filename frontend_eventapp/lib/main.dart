import 'package:flutter/material.dart';
import 'bottom_bar.dart'; 
import 'home.dart'; 
//import 'lobby.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BottomBarView(), // BottomBarView como la página inicial
      routes: {
        '/home': (context) =>  HomePage(), // Ruta para la página Home
        //'/lobby': (context) => const LobbyPage(), // Ruta para la página de lobby
        // Agrega rutas para otras páginas aquí
      },
    );
  }
}
