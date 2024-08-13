import 'package:biblia_app/ui/glosario_two/cubit/glosario_two_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NuevoGlosarioScreen extends StatelessWidget {
  static const path = '/nuevo-glosario';
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Glosario'),
      ),
      body: BlocBuilder<NuevoGlosarioCubit, NuevoGlosarioState>(
        builder: (context, state) {
          if (state.status == NuevoGlosarioStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.status == NuevoGlosarioStatus.loaded) {
            return Stack(
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
                ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: state.nuevoGlosarioModel?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = state.nuevoGlosarioModel![index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${index + 1}. ${item.transliteracionEspanol ?? ''}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Español: ${item.espanol ?? ''}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "Transliteration: ${item.transliterationEnglish ?? ''}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "English: ${item.english ?? ''}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 129, 27, 27), borderRadius: BorderRadius.circular(6)),
                                  child: Text(
                                    item.hebrewOriginalWords ?? '',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          } else if (state.status == NuevoGlosarioStatus.error) {
            return Center(child: Text('Error al cargar el glosario.'));
          } else {
            return Center(child: Text('No hay datos disponibles.'));
          }
        },
      ),
    );
  }
}
