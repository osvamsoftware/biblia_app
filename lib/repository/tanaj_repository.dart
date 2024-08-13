import 'package:biblia_app/data/book_model.dart';

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class TanajRepository {
  Future<List<BookModel>> fetchTanajFromAssets() async {
    final String response = await rootBundle.loadString('assets/tanaj.json');
    final data = await json.decode(response) as List<dynamic>;
    return data.map((json) {
      return BookModel.fromMap(json as Map<String, dynamic>);
    }).toList();
  }
}
