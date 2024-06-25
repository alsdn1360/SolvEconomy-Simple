import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:solveconomy_simple/data/dictionary_data.dart';

class DictionaryService {
  Future<List<DictionaryData>> loadDictionaryData() async {
    final jsonString = await rootBundle.loadString('assets/data/dictionary_data.json');
    final jsonResponse = json.decode(jsonString) as List;
    return jsonResponse.map((entry) => DictionaryData.fromJson(entry)).toList();
  }
}