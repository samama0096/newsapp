import 'package:flutter/material.dart';
import 'package:news_app/appui/tile.dart';
import 'package:news_app/classes/article.dart';
import 'package:news_app/classes/service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Service client = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text("iNFO",
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold))),
          backgroundColor: Colors.white),
      backgroundColor: Colors.black45,
      //Now let's call the APi services with futurebuilder wiget
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<articles>> snapshot) {
            //let's check if we got a response or not
            if (snapshot.hasData && snapshot.data != null) {
              //Now let's make a list of articles
              List<articles> article = snapshot.data;

              return ListView.builder(
                //Now let's create our custom List tile
                itemCount: article.length,
                itemBuilder: (context, index) =>
                    customListTile(article[index], context),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
