import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/api_services.dart';
import 'package:news_app/widgets/custom_listtile.dart';
import 'package:flutter_offline/flutter_offline.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'News App',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        )),
      ),
      body: Builder(builder: (BuildContext context) {
        return OfflineBuilder(
          connectivityBuilder: (BuildContext context,
              ConnectivityResult connectivity, Widget child) {
            final bool connected = connectivity != ConnectivityResult.none;
            return Stack(
              children: [
                connected
                    ? FutureBuilder<List<Article>>(
                        future: client.getArticle(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Article>> snapshot) {
                          if (snapshot.hasData) {
                            List<Article>? articles = snapshot.data;
                            return ListView.builder(
                                itemCount: articles?.length,
                                itemBuilder: (context, index) {
                                  return customListTile(
                                      articles![index], context);
                                });
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        })
                    : Center(
                        child: Text(
                          "offline",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
              ],
            );
          },
          child: Center(
            child: Text(
              "",
            ),
          ),
        );
      }),
    );
  }
}
