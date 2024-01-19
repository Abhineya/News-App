// Article class
import 'package:news_app/models/source_model.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
  return Article(
    source: Source.fromJson(json['source'] ?? {}),
    author: json['author'] != null ? json['author'].toString() : '',
    title: json['title'] != null ? json['title'].toString() : '',
    description: json['description'] != null ? json['description'].toString() : '',
    url: json['url'] != null ? json['url'].toString() : '',
    urlToImage: json['urlToImage'] != null ? json['urlToImage'].toString() : '',
    publishedAt: json['publishedAt'] != null ? json['publishedAt'].toString() : '',
    content: json['content'] != null ? json['content'].toString() : '',
  );
}

}

