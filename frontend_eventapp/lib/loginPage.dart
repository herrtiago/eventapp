import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/sesion.dart';
import 'package:google_fonts/google_fonts.dart';

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
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
        color: const Color.fromARGB(255, 235, 224, 224),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.network(
                  'https://storage.googleapis.com/cms-storage-bucket/847ae81f5430402216fd.svg',
                  height: 150),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 20),
              MouseRegion(
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica de autenticación BACKEND
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Sesion()),
                    );
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
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  child: const Text('Login',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
