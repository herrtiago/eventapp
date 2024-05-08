import 'package:flutter/material.dart';
import 'package:frontend_eventapp/crear_evento.dart';
import 'package:frontend_eventapp/event_card.dart';
import 'bottom_bar.dart'; 
import 'home.dart'; 
import 'lobby.dart';
import 'login_page.dart';
import 'policies.dart';
import 'signin_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'event_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), 
      routes: {
        '/home': (context) =>  HomePage(),
        '/login': (context) =>  LoginPage(), 
        //'/signin': (context) =>  SigninPage(),
        '/policies':(context) => PoliciessPage(),
        '/event_page': (context) => EventPage(),
        '/crear_evento': (context) => CrearEventoView(),
      },
    );
  }
}
