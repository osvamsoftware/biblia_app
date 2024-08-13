import 'dart:convert';
import 'package:biblia_app/data/glosario_two_model.dart';
import 'package:flutter/services.dart';

class NuevoGlosarioRepository {
  Future<List<NuevoGlosarioModel>> fetchNuevoGlosarioFromAssets() async {
    final jsonString = await rootBundle.loadString('assets/glosario_2.json');
    final List<dynamic> jsonData = json.decode(jsonString);

    return jsonData.map((item) => NuevoGlosarioModel.fromMap(item)).toList();
  }
}
