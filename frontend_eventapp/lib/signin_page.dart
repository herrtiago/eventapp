import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistroPage extends StatelessWidget {
  RegistroPage({Key? key}) : super(key: key);

  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerCarrera = TextEditingController();
  final TextEditingController _controllerCorreo = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirmPassword = TextEditingController();
  final TextEditingController _controllerAge = TextEditingController();
  final TextEditingController _controllerFile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Container(
                  padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
                  child: Image.asset(
                    'images/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Usuario',
                  filled: true,
                  fillColor: const Color.fromARGB(142, 218, 104, 38),
                  hintStyle: TextStyle(
                    color: Colors.white,
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
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Karla',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Carrera',
                  filled: true,
                  fillColor: const Color.fromARGB(142, 218, 104, 38),
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Karla',
                  ),
                  contentPadding: EdgeInsets.only(left: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                controller: _controllerCarrera,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Karla',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Correo institucional',
                  filled: true,
                  fillColor: const Color.fromARGB(142, 218, 104, 38),
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Karla',
                  ),
                  contentPadding: EdgeInsets.only(left: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                controller: _controllerCorreo,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Karla',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  filled: true,
                  fillColor: const Color.fromARGB(142, 218, 104, 38),
                  hintStyle: TextStyle(
                    color: Colors.white,
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
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Karla',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Confirmar contraseña',
                  filled: true,
                  fillColor: const Color.fromARGB(142, 218, 104, 38),
                  hintStyle: TextStyle(
                    color: Colors.white,
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
                controller: _controllerConfirmPassword,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Karla',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Edad',
                  filled: true,
                  fillColor: const Color.fromARGB(142, 218, 104, 38),
                  hintStyle: TextStyle(
                    color: Colors.white,
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
                controller: _controllerAge,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Karla',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Imagen',
                  filled: true,
                  fillColor: const Color.fromARGB(142, 218, 104, 38),
                  hintStyle: TextStyle(
                    color: Colors.white,
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
                controller: _controllerFile,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Karla',
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  // Verifica si las contraseñas coinciden
                  if (_controllerPassword.text != _controllerConfirmPassword.text) {
                    // Muestra un diálogo de alerta si las contraseñas no coinciden
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error de contraseña'),
                          content: Text('Las contraseñas no coinciden. Por favor, inténtalo de nuevo.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Aceptar'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // Si las contraseñas coinciden, realiza la solicitud de registro
                    final response = await http.post(
                      Uri.parse('http://20.163.25.147:8000/users'),
                      body: {
                        'username': _controllerUsername.text,
                        'career': _controllerCarrera.text,
                        'email': _controllerCorreo.text,
                        'password': _controllerPassword.text,
                        'age': int.parse( _controllerAge.text),
                        'file': _controllerFile.text,
                      },
                    );
                    if (response.statusCode == 200) {
                      // Manejo de la respuesta exitosa
                    }
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
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 217, 104, 38),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: const Text(
                  'REGISTRARME',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
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
