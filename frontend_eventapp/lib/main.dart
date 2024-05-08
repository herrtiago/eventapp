import 'package:flutter/material.dart';
import 'package:frontend_eventapp/crear_evento.dart';
import 'bottom_bar.dart'; 
import 'home.dart'; 
import 'lobby.dart';
import 'login_page.dart';
import 'policies.dart';
import 'signin_page.dart';
import 'package:google_fonts/google_fonts.dart';


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
        //'/event_page': (context) => (),
        '/crear_evento': (context) => CrearEventoView(),
      },
    );
  }
}
