import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/newspage.dart';
import 'package:news_app/services/apimanager.dart';
import 'package:news_app/services/newsmode.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEWS APP'),
      ),
      body: Container(
        child: FutureBuilder<NewsModel>(
            future: ApiManager().getNews(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                return Container(
                  child: ListView.builder(
                      itemCount: data.articles.length,
                      padding: EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => NewsPage(
                                  description: data.articles[index].description,
                                ));
                          },
                          child: Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.only(
                                  left: 10, top: 10, bottom: 10),
                              color: Colors.green.withOpacity(.3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          child: Text(
                                              data.articles[index].author ??
                                                  'error',
                                              style: TextStyle(fontSize: 18)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Container(
                                        width: 100,
                                        height: 100,
                                        child: Text(
                                            data.articles[index].publishedAt
                                                    .toString() ??
                                                'error',
                                            style: TextStyle(fontSize: 18)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    data.articles[index].title.toString() ??
                                        'error',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              )),
                        );
                      }),
                );
              } else {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ));
              }
            }),
      ),
    );
  }
}
