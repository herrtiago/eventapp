import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend_eventapp/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '/sesion.dart';


class CrearEventoView extends StatefulWidget {
  @override
  _CrearEventoViewState createState() => _CrearEventoViewState();
}

class _CrearEventoViewState extends State<CrearEventoView> {
  File? _image;

  final TextEditingController _nombreEventoController = TextEditingController();
  final TextEditingController _ubicacionEventoController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _tipoEventoController = TextEditingController();
  final TextEditingController _fechaEventoController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future getImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textFieldTextStyle = TextStyle(
      color: const Color.fromARGB(255, 86, 86, 86), 
      fontSize: 17, 
      fontWeight: FontWeight.bold, 
      fontFamily: 'Karla', 
    );

    final TextStyle titleTextStyle = TextStyle(
      color: Colors.black, // Color negro para los títulos
      fontSize: 17, // Tamaño de fuente 17
      fontWeight: FontWeight.bold, // Negrita
      fontFamily: 'Karla', // Fuente Karla
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: titleTextStyle, 
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 211, 211, 211),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (_image != null)
                          Image.file(
                            _image!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        if (_image == null)
                          Positioned.fill(
                            child: InkWell(
                              onTap: getImage,
                              child: Icon(Icons.add_a_photo, size: 50),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 8),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nombre del Evento',
                        style: titleTextStyle, 
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: textFieldTextStyle, 
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 211, 211, 211),
                          contentPadding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Nombre del Evento',
                          hintStyle: textFieldTextStyle.copyWith(color: Colors.grey), 
                        ),
                        controller: _nombreEventoController,
                      ),
                    ),
                  ],
                ),


                SizedBox(height: 8),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Ubicación',
                        style: titleTextStyle, 
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: textFieldTextStyle, 
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 211, 211, 211),
                          contentPadding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Ubicación',
                          hintStyle: textFieldTextStyle.copyWith(color: const Color.fromARGB(255, 120, 120, 120)), 
                        ),
                        controller: _ubicacionEventoController,
                      ),
                    ),
                  ],
                ),


                SizedBox(height: 8),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Fecha del Evento',
                        style: titleTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2022),
                            lastDate: DateTime(2030),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              _fechaEventoController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
                            });
                          }
                        },
                        child: IgnorePointer(
                          child: TextField(
                            style: textFieldTextStyle,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 211, 211, 211),
                              contentPadding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Fecha del Evento',
                              hintStyle: textFieldTextStyle.copyWith(color: Colors.grey),
                            ),
                            controller: _fechaEventoController,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                
                SizedBox(height: 8),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Tipo de Evento',
                        style: titleTextStyle, 
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField(
                        items: [
                          DropdownMenuItem(
                            child: Text('Deportivo', style: textFieldTextStyle),
                            value: 'Deportivo',
                          ),
                          DropdownMenuItem(
                            child: Text('Cultural', style: textFieldTextStyle),
                            value: 'Cultural',
                          ),
                          DropdownMenuItem(
                            child: Text('Académico', style: textFieldTextStyle),
                            value: 'Académico',
                          ),
                          DropdownMenuItem(
                            child: Text('Entretenimiento', style: textFieldTextStyle),
                            value: 'Entretenimiento',
                          ),
                          DropdownMenuItem(
                            child: Text('Otro', style: textFieldTextStyle),
                            value: 'Otro',
                          ),
                          // 
                        ],
                        onChanged: (value) {_tipoEventoController.text = value.toString();},
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 211, 211, 211),
                          contentPadding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Descripción',
                        style: titleTextStyle, 
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: textFieldTextStyle.copyWith(color: Color.fromARGB(255, 85, 85, 85)),
                        textAlignVertical: TextAlignVertical.top,
                        maxLines: 5,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 211, 211, 211),
                          contentPadding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Descripción  del evento',
                          hintStyle: textFieldTextStyle.copyWith(color: Colors.grey), 
                        ),
                        controller: _descripcionController,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          _nombreEventoController.clear(); 
                          _ubicacionEventoController.clear(); 
                          _descripcionController.clear(); 

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()), 
                          );
                        },
                        icon: Icon(Icons.close, color: Colors.white),
                        label: Text('Cancelar', style: textFieldTextStyle.copyWith(color: Colors.white)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFD96826)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), 
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 20),

                      ElevatedButton.icon(
                        onPressed: () async {

                          print(_fechaEventoController.text);

                          final SharedPreferences prefs = await _prefs;
                          final token = prefs.getString('token');

                          final request = http.MultipartRequest('POST', Uri.parse('http://20.163.25.147:8000/newpost'));
                          request.headers['Authorization'] = 'Bearer $token';
                          // print(request.headers['Authorization']);

                          request.files.add(await http.MultipartFile(
                              'file',
                              _image!.readAsBytes().asStream(),
                              _image!.lengthSync(),
                              filename: _image!.path.split('/').last));
                          request.fields['title'] =
                              _nombreEventoController.text;
                          request.fields['content'] =
                              _descripcionController.text;
                          request.fields['location'] =
                              _ubicacionEventoController.text;
                          request.fields['datetime'] =
                              _fechaEventoController.text;
                          request.fields['type_event'] =
                              _tipoEventoController.text;
                          request.fields['tags'] = "const";

                          final response = await request.send();
                          var responseBody =
                              await response.stream.bytesToString();

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                content: Text(
                                  'Evento creado exitosamente',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontFamily: 'Karla',
                                  ),
                                ),
                                actions: <Widget>[
                                  Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Aceptar',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: 'Karla',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                ],
                              );
                            },
                          );

                        },
                        icon: Icon(Icons.check, color: Colors.white),
                        label: Text('Guardar', style: textFieldTextStyle.copyWith(color: Colors.white)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3F768B)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
