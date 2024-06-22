import 'dart:convert';

import 'package:flutter/services.dart';

class DictionaryData {
  final String word;
  final String description;

  DictionaryData({
    required this.word,
    required this.description,
  });

  factory DictionaryData.fromJson(Map<String, dynamic> json) {
    return DictionaryData(
      word: json['word'],
      description: json['description'],
    );
  }

  static Future<List<DictionaryData>> loadDictionaryData() async {
    final jsonString = await rootBundle.loadString('assets/data/dictionary_data.json');
    final jsonResponse = json.decode(jsonString) as List;
    return jsonResponse.map((entry) => DictionaryData.fromJson(entry)).toList();
  }
}
