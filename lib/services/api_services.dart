import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/article_model.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business& apiKey=90c8243fd5f94657bd9b3c4d8b1fbfd9";

  Future<List<Article>> getArticle() async {
    try {
      http.Response res = await http.get(Uri.parse(endPointUrl));

      if (res.statusCode == 200) {
        Map<String, dynamic>? json = jsonDecode(res.body);

        if (json != null && json.containsKey('articles')) {
          List<dynamic> body = json['articles'];
          List<Article> articles = body
              .map(
                (dynamic item) => Article.fromJson(item),
              )
              .toList();
          return articles;
        } else {
          throw Exception(
              "Articles field is null or not found in the API response");
        }
      } else {
        throw Exception(
            "Failed to get articles. Status code: ${res.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to get articles. Error: $e");
    }
  }
}
