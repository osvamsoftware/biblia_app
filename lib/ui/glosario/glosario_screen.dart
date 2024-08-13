import 'package:biblia_app/data/glosario_model.dart';
import 'package:biblia_app/ui/glosario/cubit/glosario_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlosarioScreen extends StatelessWidget {
  static const path = '/glosario';
  const GlosarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Glosario'),
      ),
      body: BlocBuilder<GlosarioCubit, GlosarioState>(
        builder: (context, state) {
          if (state.status == GlosarioStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.status == GlosarioStatus.loaded) {
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
                SingleChildScrollView(
                  child: Column(
                    children: state.glosarioModel!.asMap().entries.map((entry) {
                      int index = entry.key;
                      GlosarioModel item = entry.value;
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        elevation: 4.0,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 129, 27, 27),
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(" P. Fonética: ${item.palabrasFonticaHebrea}"),
                          subtitle: Text("Significado: ${item.significado}"),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text('Press the button to load data.'));
          }
        },
      ),
    );
  }
}
