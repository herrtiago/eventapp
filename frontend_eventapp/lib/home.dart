import 'package:flutter/material.dart';
import 'bottom_bar.dart'; 
import 'top_bar.dart'; 

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarView(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Contenido de la página'),
                  SizedBox(height: 20),
                  Image.asset(
                    'images/logo.png',
                    height: 150,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBarView(),
    );
  }
}
