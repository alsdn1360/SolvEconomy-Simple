import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:solveconomy_simple/service/naver_news/naver_news_credential.dart';

class NaverNewsService {
  Future<List<dynamic>> loadNews(String query) async {
    final url = Uri.parse('https://openapi.naver.com/v1/search/news.json?query=$query');
    final response = await http.get(
      url,
      headers: {
        // 네이버 디벨로퍼의 검색 API 등록 후 사용
        'X-Naver-Client-Id': naverClientId,
        'X-Naver-Client-Secret': naverClientSecret,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['items'];
    } else {
      throw Exception('Failed to load news');
    }
  }
}
