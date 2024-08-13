import 'dart:convert';

class BookModel {
  final String? nombre;
  final Info? info;
  final Map<String, Map<String, Captulo>>? captulos;

  BookModel({
    this.nombre,
    this.info,
    this.captulos,
  });

  BookModel copyWith({
    String? nombre,
    Info? info,
    Map<String, Map<String, Captulo>>? captulos,
  }) =>
      BookModel(
        nombre: nombre ?? this.nombre,
        info: info ?? this.info,
        captulos: captulos ?? this.captulos,
      );

  factory BookModel.fromJson(String str) => BookModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookModel.fromMap(Map<String, dynamic> json) => BookModel(
        nombre: json["nombre"],
        info: json["info"] == null ? null : Info.fromMap(json["info"]),
        captulos: Map.from(json["capítulos"]!).map((k, v) => MapEntry<String, Map<String, Captulo>>(
            k, Map.from(v).map((k, v) => MapEntry<String, Captulo>(k, Captulo.fromMap(v))))),
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "info": info?.toMap(),
        "capítulos": Map.from(captulos!).map(
            (k, v) => MapEntry<String, dynamic>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v.toMap())))),
      };
}

class Captulo {
  final String? texto;
  final List<String>? referencias;

  Captulo({
    this.texto,
    this.referencias,
  });

  Captulo copyWith({
    String? texto,
    List<String>? referencias,
  }) =>
      Captulo(
        texto: texto ?? this.texto,
        referencias: referencias ?? this.referencias,
      );

  factory Captulo.fromJson(String str) => Captulo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Captulo.fromMap(Map<String, dynamic> json) => Captulo(
        texto: json["texto"],
        referencias: json["referencias"] == null ? [] : List<String>.from(json["referencias"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "texto": texto,
        "referencias": referencias == null ? [] : List<dynamic>.from(referencias!.map((x) => x)),
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
