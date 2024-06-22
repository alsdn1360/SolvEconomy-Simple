import 'dart:convert';

import 'package:flutter/services.dart';

class QuizData {
  final String question;
  final String answer;
  final String option1;
  final String option2;
  final String option3;
  final String option4;

  QuizData({
    required this.question,
    required this.answer,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
  });

  factory QuizData.fromJson(Map<String, dynamic> json) {
    return QuizData(
      question: json['question'],
      answer: json['answer'],
      option1: json['option1'],
      option2: json['option2'],
      option3: json['option3'],
      option4: json['option4'],
    );
  }

  static Future<List<QuizData>> loadQuizData(String path) async {
    final jsonString = await rootBundle.loadString(path);
    final List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map((data) => QuizData.fromJson(data)).toList();
  }
}
