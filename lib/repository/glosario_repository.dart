import 'package:biblia_app/data/glosario_model.dart';

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class GlosarioRepository {
  Future<List<GlosarioModel>> fetchGlosarioFromAssets() async {
    final String response = await rootBundle.loadString('assets/tabla_glosario.json');
    final data = await json.decode(response) as List<dynamic>;

    return data.map((json) {
      return GlosarioModel.fromMap(json as Map<String, dynamic>);
    }).toList();
  }
}
