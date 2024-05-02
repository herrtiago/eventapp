import 'package:flutter/material.dart';
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
  ];

  //cambio de página
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Mostrar la página actual según el índice seleccionado
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped, // Función para manejar el cambio de página
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Eventos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
        ],
      ),
    );
  }
}
