import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaysAndDonations extends StatelessWidget {
  static const path = '/pays-and-donations';

  const PaysAndDonations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayudas y Ofrendas Voluntarias'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.orange.withOpacity(.40),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '“Y todo lo que hagáis, hacedlo de corazón, como para Yahweh y no para los hombres.”\n\n'
                    'Cada donación es voluntaria y nos permite alcanzar nuevas metas, crear más oportunidades de servicio, y extender nuestra misión a un mayor número de personas. '
                    'Con tu apoyo, podemos fortalecer nuestras actividades, desarrollar nuevos proyectos, y continuar impactando vidas de manera positiva.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'tamildimdeyahshua@gmail.com',
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        icon: Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: 'tamildimdeyahshua@gmail.com'));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Email copiado al portapapeles')),
                          );
                        },
                      ),
                    ],
                  ),
                  // Imagen del código QR

                  SizedBox(height: 20),
                  // Texto explicativo
                  Text(
                    'Escanea el código QR para hacer una donación voluntaria:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  Image.asset("assets/images/qr.png", height: 200, width: 200),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
