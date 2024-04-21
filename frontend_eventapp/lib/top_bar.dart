import 'package:flutter/material.dart';

class TopBarView extends StatelessWidget implements PreferredSizeWidget {
  const TopBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          //menú
        },
      ),
      title: Text('My App'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            //notificaciones
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); //
}
