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
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4, 
                child: Container(
                  padding: const EdgeInsets.all(50), 
                  child: Image.asset(
                    'images/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 20), 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                    filled: true,
                    fillColor: const Color.fromARGB(142, 218, 104, 38),
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(186, 255, 255, 255),
                      fontSize: 17,
                      fontFamily: 'Karla',
                    ),
                    contentPadding: EdgeInsets.only(left: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  controller: _controllerUsername,
                ),
              ),
              SizedBox(height: 33),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    filled: true,
                    fillColor: Color.fromARGB(142, 218, 104, 38),
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(186, 255, 255, 255),
                      fontSize: 17,
                      fontFamily: 'Karla',
                    ),
                    contentPadding: EdgeInsets.only(left: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  obscureText: true,
                  controller: _controllerPassword,
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (newValue) {
                        //cambio del valor del checkbox
                      },
                    ),
                    Text(
                      'Recordar contraseña',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Karla',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
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
                        return const Size(200, 60); 
                      }
                      return const Size(180, 50); 
                    },
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFD96826)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    color: Color.fromARGB(186, 255, 255, 255),
                    fontSize: 15,
                    fontFamily: 'Karla',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}