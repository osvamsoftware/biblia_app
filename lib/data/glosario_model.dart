import 'dart:convert';

class GlosarioModel {
  final String? palabrasFonticaHebrea;
  final String? significado;

  GlosarioModel({
    this.palabrasFonticaHebrea,
    this.significado,
  });

  GlosarioModel copyWith({
    String? palabrasFonticaHebrea,
    String? significado,
  }) =>
      GlosarioModel(
        palabrasFonticaHebrea: palabrasFonticaHebrea ?? this.palabrasFonticaHebrea,
        significado: significado ?? this.significado,
      );

  factory GlosarioModel.fromJson(String str) => GlosarioModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GlosarioModel.fromMap(Map<String, dynamic> json) => GlosarioModel(
        palabrasFonticaHebrea: json["Palabras Fonética Hebrea"],
        significado: json["Significado"],
      );

  Map<String, dynamic> toMap() => {
        "Palabras Fonética Hebrea": palabrasFonticaHebrea,
        "Significado": significado,
      };
}
