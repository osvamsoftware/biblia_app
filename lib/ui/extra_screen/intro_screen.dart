import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  static const path = "/intro";
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Traducción Fidedigna'),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Opacity(
              opacity: isDarkMode ? 0.1 : 0.5,
              child: Image.asset(
                'assets/images/pap_background.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(
                  child: SizedBox(width: 200, child: Image.asset('assets/images/logo.png')),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Theme.of(context).colorScheme.onBackground,
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(
                        text: '“TRADUCCIÓN FIDEDIGNA”\n\n',
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, fontFamily: 'Serif'),
                      ),
                      TextSpan(
                        text:
                            'Esta Traducción es una Restauración más fidedigna de otras traducciones restauradas con el fin de quitar TODA añadidura UNICISTA, TRINITARISTA Y ERRORES DE TRADUCCIÓN DE CRISTIANOS QUE SE DEJARON INFLUENCIAR POR SUS IDEAS PRECONCEBIDAS.\n\n',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      TextSpan(
                        text: 'El trabajo para tener lista esta Escritura ha durado 7 años.\n\n',
                      ),
                      TextSpan(
                        text: 'Para esta publicación única de ',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                          text: 'LA TANAJ Y BRIT JADASHÁ HA TORAH HA YAHWEH ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text:
                            'he usado los textos Masoréticos como textos bases para el Tanaj y Manuscritos de las Cartas de los Shelujim junto a los Escritos de los Padres Apostólicos. También cotejé la Peshita del siglo II y la Biblia de Jerusalén en sus versiones más antiguas. Entonces procedí a corregir las redacciones obvias y vergonzosamente manipuladas por los editores Masoréticos hebreos, cristianos y mesiánicos y otros actuales. Además, he reinsertado el nombre Verdadero en estas Fuentes fundamentales.\n\n',
                      ),
                      TextSpan(
                        text:
                            'Después de considerar en TEFILAT (Oración) y estudio, y siguiendo siempre la Guía del Ruaj HaKodesh en cada revisión minuciosa, he usado fuentes claves tales como Los Manuscritos del Mar Muerto (El Qumrám).\n\n',
                      ),
                      TextSpan(
                        text:
                            'La mayoría de las fuentes consultadas han sido Semíticas, puesto que creo que fueron inspiradas y escritas en las lenguas semíticas tales como el hebreo y el arameo.\n\n',
                      ),
                      TextSpan(
                        text: 'LA TIFERET (Gloria y Honra) DE ESTA TRADUCCIÓN ES A YAHWEH\n\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            'Mi propósito en publicar LA KITBÉ YISRAELITA RESTAURADA 5997, es dar a todos los benei Yisrael, la oportunidad de seguir radicalmente la Guía de Yahweh para que, en este último tiempo, todo Yisrael tuviera en sus manos una traducción FINAL que ante todo y sobre todo, levanta y proclama El Shem (Nombre) Verdadero de הוהי (Yahweh) como apareció originalmente en el Primer Brit (Pacto) casi 7,000 veces en las fuentes históricas fiables Semíticas. Inserciones adicionales fueron basadas sobre la consistencia e inmutabilidad del Abba Celestial, cuyo Nombre no cambia (Shemot 3:14-15).\n\n',
                      ),
                      TextSpan(
                        text:
                            'Para el Brit Jadashá (Nuevo Pacto) he incluido el Nombre verdadero del Mashiaj עשהי (Yahshua) que fue cambiado a nombres errados y que no correspondían a su esencia hebrea, ya que los nombres propios hebreos no se pueden traducir a ninguna lengua.\n\n',
                      ),
                      TextSpan(
                        text: 'SEFER INCLUIDOS Y ACEPTADOS COMO INSPIRADOS\n\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '-YANOKJ (Se ha incluido al final de Devarim)\n',
                      ),
                      TextSpan(
                        text: '-YASHAR (Se ha incluido después de Yanokj)\n',
                      ),
                      TextSpan(
                        text: '-JUBILEOS (Se ha incluido después de Yahoshua)\n',
                      ),
                      TextSpan(
                        text: '-LOS DICHOS DE YAHSHUA (Tomás)\n',
                      ),
                      TextSpan(
                        text: '-CLEMENTE DE ROMA (Discípulo de Kefá)\n',
                      ),
                      TextSpan(
                        text: '-SEFER A LA KAJAL DE FILADELFIA EN EL TIEMPO DEL FIN\n\n',
                      ),
                      TextSpan(
                        text: '-CARTA A LAODICEA\n\n',
                      ),
                      TextSpan(
                        text:
                            'El orden de los Manuscritos está registrado en LA TANAJ HA TORAH Y EL BRIT JADASHÁ HA YAHSHUA está hecho de tal modo que resalta a Yahweh y Sus Pactos Eternos con todo Yisrael, desde los días del desposorio en el Sinaí, la nación que estaba unida bajo Dawid y Slomoj, y a través de los exilios.\n\n',
                      ),
                      TextSpan(
                        text:
                            'Esta traducción tiene palabras de fonética hebrea que han sido necesarias dejarlas por su perfecto significado en la traducción y que ustedes podrán cotejarlas al final de la Escritura en un Glosario de traducción de dichas palabras.\n\n',
                      ),
                      TextSpan(
                        text: 'AGRADECIMIENTOS DE COLABORACIÓN:\n\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            'A hermanos y hermanas en la Emuná (Fe) Yisraelita de la “Kajal Yisraelita de Yahshua Shiló” que de una forma desinteresada han dedicado todos sus esfuerzos para que todo fuera cotejado y presentado de forma fidedigna, ayudándome en el diseño, corrección de la gramática y en la revisión y comprobación de cada pasuk (versículo).\n\n',
                      ),
                      TextSpan(
                        text:
                            'A todos vosotros, amigos y hermanos inestimables, todá rabá por vuestro ahavá a Yahweh y a Yahshua.\n\n',
                      ),
                      TextSpan(
                        text: 'Autor Moreh: Yhemaelh Zeev (Hemael López Naranjo)\n\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'INDICACIONES ADICIONALES DE LECTURA\n\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            'Para fortalecer la inspiración Ivrí (Hebrea) de la Kitbe HaKodesh, se han dejado muchas palabras en transliteración hebrea a lo largo de esta traducción, por tal motivo se incluyen en esta edición 5997 una sección de Tablas Auxiliares para facilitar la comprensión de estas palabras, Notas de pié de Página en la mayoría de los Sefer (Libros).\n\n',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
