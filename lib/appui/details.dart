import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:news_app/classes/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlePage extends StatelessWidget {
  final articles article;

  ArticlePage({this.article});

  @override
  Widget build(BuildContext context) {
    Future<void> launch_link(LinkableElement dest) async {
      if (await canLaunch(dest.url)) {
        await launch(dest.url);
      } else {
//nothing
      }
    }

    String launchUrl = article.url;
    String url =
        'http://www.intl-spectrum.com/articles/r75/ArticleDefault.jpg?x=80x56';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Article",
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width * 0.65,
                        decoration: BoxDecoration(
                          //let's add the height

                          image: DecorationImage(
                              image: article.urlToImage == null
                                  ? NetworkImage(url)
                                  : NetworkImage(article.urlToImage),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Container(
                    width: 150,
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Text(
                        article.source.name,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    article.title,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: article.description == null
                      ? Text("N/A")
                      : Text(
                          article.description,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 16.0,
                          ),
                        ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Click the below link to view the whole post :)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: article.url == null
                      ? Text(
                          "Oops! No url available here for this post..! Sorry :(")
                      : SelectableLinkify(
                          text: "Go to: https//:$launchUrl",
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontStyle: FontStyle.italic,
                            fontSize: 12.0,
                          ),
                          onOpen: launch_link,
                        ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
