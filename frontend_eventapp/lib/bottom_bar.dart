import 'package:flutter/material.dart';
import 'package:frontend_eventapp/crear_evento.dart';
import 'home.dart'; // Importa la página Home u otras páginas que desees mostrar

class BottomBarView extends StatefulWidget {
  const BottomBarView({Key? key}) : super(key: key);

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    CrearEventoView(),
  ];

  //cambio de página
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/crear_evento');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/buscar');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Crear evento',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Buscar',
        ),
      ],
      // Controla la selección del ítem
      currentIndex: _currentIndex,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
    );
  }
}
