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
}
