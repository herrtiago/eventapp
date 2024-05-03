import 'package:flutter/material.dart';
import 'bottom_bar.dart'; 
import 'home.dart'; 
import 'lobby.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LobbyPage(), // BottomBarView como la página inicial
      routes: {
        '/home': (context) =>  HomePage(),
        '/login': (context) =>  LoginPage(), // Ruta para la página de login
        //'/politicas':(context) =>  // Ruta para la página Home
        //'/lobby': (context) => const LobbyPage(), // Ruta para la página de lobby
        // Agrega rutas para otras páginas aquí
      },
    );
  }
}
