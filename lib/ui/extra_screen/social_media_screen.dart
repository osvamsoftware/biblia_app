import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  static const path = '/contact';
  final String youtubeChannel = 'https://m.youtube.com/channel/UClQ0emnI21QOJmLh2g9e8Ow';
  final String blogUrl = 'https://kehilajdetamildimdeyahshua.blogspot.com/?m=1';
  final String telegramProfile = 'https://t.me/+HWl1fZJWSSEwNDVh';
  final String email = 'mailto:informacionkajalyisraelita@gmail.com';

  Future<void> _launchUrl(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacto'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.orange.withOpacity(.40),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "¡Gracias por usar nuestra app! 🙏📖",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('''
          
          Síguenos para acceder a contenido exclusivo, reflexiones espirituales, y actualizaciones sobre nuestra app.
          La espiritualidad juega un papel vital en nuestras vidas, guiándonos, inspirándonos y brindándonos paz interior. 
          Agradecemos sinceramente tu interés y apoyo. ¡Esperamos verte en nuestros canales!
          '''),
                  Text(
                    'Contacto y Redes Sociales',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    icon: Icons.web,
                    title: 'Blog',
                    subtitle: 'Clic para ir al sitio',
                    onTap: () => _launchUrl(blogUrl),
                  ),
                  CustomButton(
                    icon: Icons.video_library,
                    title: 'Canal de YouTube',
                    iconColor: Colors.red,
                    subtitle: 'Clic para ir al sitio',
                    onTap: () => _launchUrl(youtubeChannel),
                  ),
                  CustomButton(
                    icon: Icons.message,
                    title: 'Telegram',
                    iconColor: Colors.blue,
                    subtitle: 'Clic para ir al sitio',
                    onTap: () => _launchUrl(telegramProfile),
                  ),
                  CustomButton(
                    icon: Icons.email,
                    title: 'Correo Electrónico',
                    iconColor: Colors.green,
                    subtitle: 'Clic para ir al sitio',
                    onTap: () => _launchUrl(email),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color iconColor;

  const CustomButton({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.iconColor = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(subtitle, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
