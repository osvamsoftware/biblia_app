import 'dart:convert';

class NuevoGlosarioModel {
  final String? transliteracionEspanol;
  final String? espanol;
  final String? transliterationEnglish;
  final String? english;
  final String? hebrewOriginalWords;

  NuevoGlosarioModel({
    this.transliteracionEspanol,
    this.espanol,
    this.transliterationEnglish,
    this.english,
    this.hebrewOriginalWords,
  });

  factory NuevoGlosarioModel.fromJson(String str) => NuevoGlosarioModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NuevoGlosarioModel.fromMap(Map<String, dynamic> json) => NuevoGlosarioModel(
        transliteracionEspanol: json["Transliteración en Español"],
        espanol: json["Español"],
        transliterationEnglish: json["Transliteration in English"],
        english: json["English"],
        hebrewOriginalWords: json["Hebrew/Original Words"],
      );

  Map<String, dynamic> toMap() => {
        "Transliteración en Español": transliteracionEspanol,
        "Español": espanol,
        "Transliteration in English": transliterationEnglish,
        "English": english,
        "Hebrew/Original Words": hebrewOriginalWords,
      };
}
