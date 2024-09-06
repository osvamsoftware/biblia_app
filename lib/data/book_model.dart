import 'dart:convert';

class BookModel {
  final String? nombre;
  final Info? info;
  final List<String>? referencias;
  final Map<String, Map<String, String>>? captulos;

  BookModel({
    this.nombre,
    this.info,
    this.referencias,
    this.captulos,
  });

  BookModel copyWith({
    String? nombre,
    Info? info,
    List<String>? referencias,
    Map<String, Map<String, String>>? captulos,
  }) =>
      BookModel(
        nombre: nombre ?? this.nombre,
        info: info ?? this.info,
        referencias: referencias ?? this.referencias,
        captulos: captulos ?? this.captulos,
      );

  factory BookModel.fromJson(String str) => BookModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookModel.fromMap(Map<String, dynamic> json) => BookModel(
        nombre: json["nombre"],
        info: json["info"] == null ? null : Info.fromMap(json["info"]),
        referencias: json["referencias"] == null ? [] : List<String>.from(json["referencias"]!.map((x) => x)),
        captulos: Map.from(json["capítulos"]!).map((k, v) =>
            MapEntry<String, Map<String, String>>(k, Map.from(v).map((k, v) => MapEntry<String, String>(k, v)))),
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "info": info?.toMap(),
        "referencias": referencias == null ? [] : List<dynamic>.from(referencias!.map((x) => x)),
        "capítulos": Map.from(captulos!)
            .map((k, v) => MapEntry<String, dynamic>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
      };
}

class Info {
  final String? enIvri;
  final String? espaol;
  final String? significado;

  Info({
    this.enIvri,
    this.espaol,
    this.significado,
  });

  Info copyWith({
    String? enIvri,
    String? espaol,
    String? significado,
  }) =>
      Info(
        enIvri: enIvri ?? this.enIvri,
        espaol: espaol ?? this.espaol,
        significado: significado ?? this.significado,
      );

  factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        enIvri: json["En ivri"],
        espaol: json["Español"],
        significado: json["Significado"],
      );

  Map<String, dynamic> toMap() => {
        "En ivri": enIvri,
        "Español": espaol,
        "Significado": significado,
      };
}
