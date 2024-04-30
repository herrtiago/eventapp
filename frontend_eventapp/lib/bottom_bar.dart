import 'package:flutter/material.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({Key? key}) : super(key: key);

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  int currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> widgetOption = [
    Placeholder(), // Reemplazar con tu widget correspondiente
    Placeholder(),
    Placeholder(),
  ];

  final TextStyle _textStyle = TextStyle(
    color: const Color.fromARGB(255, 86, 86, 86),
    fontSize: 17,
    fontWeight: FontWeight.bold,
    fontFamily: 'Karla',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTapped,
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true, // Asegura que se muestren las etiquetas seleccionadas
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Mis eventos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
        ],
        // Estilo personalizado para el texto seleccionado
        selectedLabelStyle: TextStyle(
          color: const Color.fromARGB(255, 86, 86, 86),
          fontSize: 17,
          fontWeight: FontWeight.bold,
          fontFamily: 'Karla',
        ),
        // Estilo personalizado para el texto no seleccionado
        unselectedLabelStyle: TextStyle(
          color: const Color.fromARGB(255, 86, 86, 86),
          fontSize: 17,
          fontWeight: FontWeight.normal,
          fontFamily: 'Karla',
        ),
      ),
      body: widgetOption[currentIndex],
    );
  }
}
