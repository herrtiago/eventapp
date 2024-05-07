import 'package:flutter/material.dart';
import 'top_bar.dart'; 
import 'bottom_bar.dart';

class HomePage extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    color: const Color.fromARGB(255, 86, 86, 86),
    fontSize: 17,
    fontWeight: FontWeight.bold,
    fontFamily: 'Karla',
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Scaffold(
            appBar: const TopBarView(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Contenido de la página',
                    style: _textStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
        BottomBarView(),
      ],
    );
  }
}
