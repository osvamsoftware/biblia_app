import 'package:biblia_app/data/book_model.dart';

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class BritJadashaRepository {
  Future<List<BookModel>> fetchBritFromAssets() async {
    final String response = await rootBundle.loadString('assets/brit_jadasha.json');
    final data = await json.decode(response) as List<dynamic>;

    return data.map((json) {
      return BookModel.fromMap(json as Map<String, dynamic>);
    }).toList();
  }
}
