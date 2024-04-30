import 'package:flutter/material.dart';

class TopBarView extends StatelessWidget implements PreferredSizeWidget {
  const TopBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          // menú
        },
      ),
      title: SizedBox(
        width: 120, // Ancho deseado para la imagen
        height: kToolbarHeight, // Alto de la barra de navegación
        child: Image.asset(
          'images/logo.png', // Ruta de la imagen
          fit: BoxFit.contain, // Ajustar la imagen para que quepa dentro del contenedor
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
  Size get preferredSize => Size.fromHeight(kToolbarHeight); //
}
