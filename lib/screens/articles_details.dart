// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:news_app/models/article_model.dart';

// ignore: must_be_immutable
class ArticlesDetailPage extends StatelessWidget {
  Article article;
  ArticlesDetailPage({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(article.urlToImage),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0)),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
              child: Text(
                article.source.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              article.description,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
