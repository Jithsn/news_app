import 'package:flutter/material.dart';
import 'package:news_app/services/newsmode.dart';

class NewsPage extends StatefulWidget {
  String description;
  NewsPage({Key key, this.description}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Column(
          children: [
            Text(widget.description ?? 'error'),
          ],
        ),
      )),
    );
  }
}
