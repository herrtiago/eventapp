import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/sesion.dart'; 
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.justAnotherHandTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: GoogleFonts.justAnotherHand(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 4, 61, 90),
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(80),
                child: Image.asset(
                  'images/logo.png',  // Path to the local image file
                  height: 150,
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                    filled: true,
                    fillColor: const Color.fromARGB(142, 218, 104, 38), // Color de fondo
                    labelStyle: TextStyle(color: const Color.fromARGB(186, 255, 255, 255), fontSize: 30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20), // Bordes curvos
                      borderSide: BorderSide.none, // Eliminar los bordes
                    ),
                  ),
                  controller: _controllerUsername,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    filled: true,
                    fillColor: Color.fromARGB(142, 218, 104, 38), // Color de fondo
                    labelStyle: TextStyle(color: const Color.fromARGB(186, 255, 255, 255), fontSize: 30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20), // Bordes curvos
                      borderSide: BorderSide.none, // Eliminar los bordes
                    ),
                  ),
                  obscureText: true,
                  controller: _controllerPassword,
                ),
              ),
              const SizedBox(height: 20),
              MouseRegion(
                child: ElevatedButton(
                  onPressed: () async {
                    final response = await http.post(
                      Uri.parse('http://20.163.25.147:8000/login'),
                      body: {
                        'username': _controllerUsername.text,
                        'password': _controllerPassword.text,
                      },
                    );
                    if (response.statusCode == 200) {
                      final SharedPreferences prefs = await _prefs;
                      await prefs.setString('token', response.body);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Sesion()),
                      );
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.resolveWith<Size>(
                      (states) {
                        if (states.contains(MaterialState.hovered)) {
                          return const Size(200, 60); //hover
                        }
                        return const Size(180, 50); //normal
                      },
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFD96826)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  child: const Text('Login',
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}