import 'package:flutter/material.dart';
import 'package:newsapp1/xuexi/1/home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> tabs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs.add(tab('Business'));
    tabs.add(tab('Entertainment'));
    tabs.add(tab('General'));
    tabs.add(tab('Health'));
    tabs.add(tab('Science'));
    tabs.add(tab('Sports'));
    tabs.add(tab('Technology'));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: AppBar(
                elevation: 0.0,
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('English'),
                    Text('News',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ))
                  ]),
              bottom: TabBar(
                tabs: tabs,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
              )),
          body: TabBarView(
            children: [
              ListArticles(catOfNews: 'business'),
              ListArticles(catOfNews: 'entertainment'),
              ListArticles(catOfNews: 'general'),
              ListArticles(catOfNews: 'health'),
              ListArticles(catOfNews: 'science'),
              ListArticles(catOfNews: 'sports'),
              ListArticles(catOfNews: 'technology'),
            ],
          )
          ),
    );
  }
}

Widget tab(String tabName) {
  return Tab(
    text: tabName,
  );
}
