import 'package:flutter/material.dart';

class TopBarView extends StatelessWidget implements PreferredSizeWidget {
  const TopBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      title: SizedBox(
        width: 120,
        height: kToolbarHeight,
        child: Image.asset(
          'images/logo.png',
          fit: BoxFit.contain,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            // notificaciones
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  static Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(93, 255, 255, 255),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 70, left: 20), // Padding superior
                child: Text(
                  'Cuenta',
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              onTap: () {
                Navigator.pop(context); 
                Navigator.pushNamed(context, '/cuenta'); 
              },
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 20), // Padding superior
                child: Text(
                  'Configuración',
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              onTap: () {
                Navigator.pop(context); 
                Navigator.pushNamed(context, '/configuracion'); 
              },
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 20), // Padding superior
                child: Text(
                  'Crear Evento',
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              onTap: () {
                Navigator.pop(context); 
                Navigator.pushNamed(context, '/crear_evento'); 
              },
            ),
          ],
        ),
      ),
    );
  }
}
