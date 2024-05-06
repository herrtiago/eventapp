import 'package:flutter/material.dart';
import 'bottom_bar.dart'; 
import 'home.dart'; 
import 'lobby.dart';
import 'login_page.dart';
import 'policies.dart';
//import 'signin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LobbyPage(), 
      routes: {
        '/home': (context) =>  HomePage(),
        '/login': (context) =>  LoginPage(), 
        //'/signin': (context) =>  SigninPage(),
        '/policies':(context) => PoliciessPage(),
        //'/lobby': (context) => const LobbyPage(), // Ruta para la página de lobby
        // Agrega rutas para otras páginas aquí
      },
    );
  }
}
