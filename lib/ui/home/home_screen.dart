import 'package:biblia_app/ui/brit_jadasha/cubit/brit_jadasha_cubit.dart';
import 'package:biblia_app/ui/extra_screen/intro_screen.dart';
import 'package:biblia_app/ui/extra_screen/pays_and_donation_screen.dart';
import 'package:biblia_app/ui/global_book/chapter_screen.dart';
import 'package:biblia_app/ui/global_book/cubit/font_cubit.dart';
import 'package:biblia_app/ui/global_book/cubit/theme_cubit.dart';
import 'package:biblia_app/ui/extra_screen/social_media_screen.dart';
import 'package:biblia_app/ui/glosario/glosario_screen.dart';
import 'package:biblia_app/ui/glosario_two/nuevo_glosario_screen.dart';
import 'package:biblia_app/ui/tanaj/cubit/tanaj_cubit.dart';
import 'package:biblia_app/ui/global_book/cubit/global_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const path = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kitbé Hakodesh'),
      ),
      drawer: Drawer(
        backgroundColor: isDarkMode ? null : Color.fromARGB(255, 122, 19, 19),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: const EdgeInsets.all(0),
              decoration: const BoxDecoration(color: Colors.orange),
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      'assets/images/pap_background.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Shalóm Alejem',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                        SizedBox(height: 90, child: Image.asset('assets/images/logo.png'))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // ListTile(
            //   leading: Icon(color: Colors.white,Icons.home),
            //   title: Text('Perfil'),
            //   onTap: () {
            //     context.go('/profile');
            //   },
            // ),
            // ListTile(
            //   leading: Icon(color: Colors.white,Icons.info),
            //   title: Text('Información'),
            //   onTap: () {
            //     context.go('/info');
            //   },
            // ),
            // ListTile(
            //   leading: Icon(color: Colors.white,Icons.settings),
            //   title: Text('Ajustes'),
            //   onTap: () {
            //     context.go('/settings');
            //   },
            // ),
            ListTile(
              leading: const Icon(color: Colors.white, Icons.check),
              title: const Text('Introducción', style: TextStyle(color: Colors.white)),
              onTap: () {
                context.push(IntroScreen.path);
              },
            ),
            ListTile(
              leading: const Icon(color: Colors.white, Icons.book),
              title: const Text(style: TextStyle(color: Colors.white), 'Tanaj'),
              onTap: () {
                context.read<GlobalBookCubit>().setCurrentCollection(context.read<TanajCubit>().state.tanajData);
                context.push(CollectionListScreen.path);
              },
            ),
            ListTile(
              leading: const Icon(color: Colors.white, Icons.book),
              title: const Text(style: TextStyle(color: Colors.white), 'Brit Jadasha'),
              onTap: () {
                context.read<GlobalBookCubit>().setCurrentCollection(context.read<BritJadashaCubit>().state.tanajData);
                context.push(CollectionListScreen.path);
              },
            ),
            ListTile(
              leading: const Icon(color: Colors.white, Icons.article_outlined),
              title: const Text(style: TextStyle(color: Colors.white), 'Glosario KITBE HAKODESH 6000'),
              onTap: () {
                context.push(GlosarioScreen.path);
              },
            ),
            ListTile(
              leading: const Icon(color: Colors.white, Icons.article_outlined),
              title: const Text(style: TextStyle(color: Colors.white), 'Glosario de términos Hebreos'),
              onTap: () {
                context.push(NuevoGlosarioScreen.path);
              },
            ),
            ListTile(
              leading: const Icon(color: Colors.white, Icons.contact_page),
              title: const Text(style: TextStyle(color: Colors.white), 'Redes y Contacto'),
              onTap: () {
                context.push(ContactScreen.path);
              },
            ),
            ListTile(
              leading: const Icon(color: Colors.white, Icons.wallet),
              title: const Text(style: TextStyle(color: Colors.white), 'Ofrendas y Donaciones'),
              onTap: () {
                context.push(PaysAndDonations.path);
              },
            ),
            ListTile(
              title: const Text(style: TextStyle(color: Colors.white), 'Modo oscuro'),
              trailing: BlocBuilder<ThemeCubit, ThemeData>(
                builder: (context, theme) {
                  return Switch(
                    value: theme.brightness == Brightness.dark,
                    onChanged: (value) {
                      context.read<ThemeCubit>().toggleTheme(value);
                    },
                  );
                },
              ),
            ),
            ListTile(
              title: const Text(style: TextStyle(color: Colors.white), 'Escala de fuente'),
              trailing: BlocBuilder<FontSizeCubit, double>(
                builder: (context, fontSize) {
                  return Text(style: TextStyle(color: Colors.white), '${(fontSize * 100).toInt()}%');
                },
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height * .3,
                      width: double.infinity,
                      child: Dialog(child: BlocBuilder<FontSizeCubit, double>(
                        builder: (context, fontSize) {
                          return SizedBox(
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      'Elige una escala de la fuente, y reinicia la app para aplicar los cambios.'),
                                ),
                                Slider(
                                  value: fontSize,
                                  min: 0.8,
                                  max: 1.5,
                                  divisions: 7,
                                  label: '${(fontSize * 100).toInt()}%',
                                  onChanged: (value) {
                                    context.read<FontSizeCubit>().updateFontSize(value);
                                  },
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Aceptar'))
                              ],
                            ),
                          );
                        },
                      )),
                    );
                  },
                );
              },
            ),
            // Agrega más opciones si es necesario
          ],
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: Image.asset('assets/images/home.png', fit: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}
