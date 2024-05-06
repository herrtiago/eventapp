import 'package:flutter/material.dart';

class PoliciessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEEB697), 
        title: const Text(''), 
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body:  Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'POLÍTICA Y PRIVACIDAD',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Event App',
                    style: TextStyle(color: Color(0xFFEEB697), fontSize: 24),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. CONDICIONES GENERALES DE USO',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'La Empresa podrá, en cualquier momento y sin necesidad de previo aviso, realizar cambios y actualizaciones de las presentes Condiciones de Uso y de la Política de Privacidad. Estos cambios serán publicados en la Web y en la Aplicación y serán efectivos desde el momento de su publicación. Como consecuencia de lo anterior, el usuario deberá revisar periódicamente si hay cambios en estas Condiciones y, tanto si existe consentimiento expreso como si no, si el usuario continúa usando el servicio tras la publicación, ello implica la aceptación y asunción de los mismos. En caso de que no esté de acuerdo con las actualizaciones de las Condiciones de uso o de la Política de Privacidad, podrá renunciar dejando de usar el Servicio. El acceso de la aplicación es gratuito salvo en lo relativo al coste de la conexión a través de la red de telecomunicaciones suministrada por el proveedor de acceso contratado por los usuarios. El uso de la aplicación atribuye la condición de usuario de la misma e implica la lectura, entendimiento y aceptación de todos los términos y condiciones recogidas por la presente.',
                    ),
                    SizedBox(height: 20),
                    Text(
                      'USO DE LA APLICACIÓN Y SUS SERVICIOS',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'El Usuario reconoce y acepta que el uso de los contenidos y/o servicios ofrecidos por la presente aplicación será bajo su exclusivo riesgo y/o responsabilidad. El Usuario se compromete a utilizar la presente aplicación y todo su contenido y Servicios de conformidad con la ley, la moral, el orden público y las presentes Condiciones de Uso, y las Condiciones Particulares que, en su caso, le sean de aplicación. Asimismo, se compromete a hacer un uso adecuado de los servicios y/o contenidos de la aplicación móvil y a no emplearlos para realizar actividades ilícitas o constitutivas de delito, que atenten contra los derechos de terceros y/o que infrinjan la regulación sobre propiedad intelectual e industrial, o cualesquiera otras normas del ordenamiento jurídico aplicable.',
                    ),
                    SizedBox(height: 20),
                    Text(
                      '2. POLÍTICA DE PRIVACIDAD',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Todos los datos que se solicitan a los usuarios y clientes a través de la aplicación serán necesarios para prestar el servicio objeto del servicio en virtud del cual se ha procedido al uso de la aplicación en los correspondientes dispositivos.',
                    ),
                    SizedBox(height: 20),
                    Text(
                      'CONSENTIMIENTO',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'La utilización de la aplicación dará lugar al tratamiento de datos de carácter personal que Event App, en su caso, llevará a cabo de acuerdo con las normas y procedimientos internos establecidos al efecto, que son conocidos por los clientes y usuarios y autorizados por éstos.',
                    ),
                    SizedBox(height: 20),
                    Text(
                      'GARANTÍA Y PROTECCIÓN DE DATOS',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'En el tratamiento de los datos de carácter personal, Event App se compromete a garantizar y proteger las libertades públicas y los derechos fundamentales de las personas físicas de los ficheros y, especialmente, su honor y su intimidad familiar y personal, obligándose en este sentido, a efectuar el correspondiente tratamiento de datos de acuerdo con la normativa vigente en cada momento y a guardar el más absoluto secreto en relación con la información entregada por los clientes y usuarios. Los datos de carácter personal objeto de tratamiento no se utilizarán para otras finalidades que no se encuentren aquí recogidas o, en su caso, por otro documento o contrato que vincule a ambas partes con condiciones particulares.',
                    ),
                    SizedBox(height: 50),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Event App - Somos Familia',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEB697),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
