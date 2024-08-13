import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontSizeCubit extends Cubit<double> {
  static const String _fontSizeKey = 'fontSize';

  FontSizeCubit() : super(1.0);

  Future<void> loadFontSize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double fontSize = prefs.getDouble(_fontSizeKey) ?? 1.0;
    emit(fontSize);
  }

  void updateFontSize(double scale) {
    emit(scale);
    _saveFontSize(scale);
  }

  Future<void> _saveFontSize(double scale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_fontSizeKey, scale);
  }
}
