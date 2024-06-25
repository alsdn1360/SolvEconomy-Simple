import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:solveconomy_simple/data/quiz_data.dart';

class QuizService {
  Future<List<QuizData>> loadQuizData() async {
    final jsonString = await rootBundle.loadString('assets/data/quiz_data.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map((data) => QuizData.fromJson(data)).toList();
  }
}