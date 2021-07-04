import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp1/xuexi/1/helper/news.dart';
import 'package:newsapp1/xuexi/1/models/article_model.dart';
import 'package:newsapp1/xuexi/1/article_view.dart';

class ListArticles extends StatefulWidget {
  String catOfNews;
  ListArticles({this.catOfNews});

  @override
  ListArticlesState createState() => ListArticlesState();
}

class ListArticlesState extends State<ListArticles> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading =false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews(widget.catOfNews);
  }

  getNews(String catOfNews) async{
    News newsClass = News();  
    await newsClass.getNews(catOfNews);
    articles = newsClass.news;
    setState(() {
      _loading= false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Container(
          child:Column(
            children: [
              //Blogs
              _loading ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [CircularProgressIndicator()],
              ) :Container(
              padding: EdgeInsets.only(top:10, left:10, right:10),
              child: ListView.builder(
                itemCount:articles.length,
                // itemCount:articles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index){
                  return BlogTile(
                    imageUrl: articles[index].urlToImage,
                    title: articles[index].title,
                    desc: articles[index].description,
                    url: articles[index].url,
                  );
                }
              )
            ),
              
           
            ],
            )
        ),
      ),
    );
  }
}
class CategoryTile1 extends StatelessWidget {
  final imageUrl, categoryName;
  // VoidC
  final VoidCallback onCountSelected;
  final Function(String) onCountChanged;
  CategoryTile1({this.imageUrl,this.categoryName, this.onCountSelected, this.onCountChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        onCountChanged(categoryName);
        print('hhh');
        
      },
        child: Container(
        margin: EdgeInsets.only(right:16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(imageUrl: imageUrl, width: 120, height: 60, fit: BoxFit.cover)),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              width: 120, height: 60,
              child:Text(categoryName, style:TextStyle(
                color:Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ))
            )
          ],
        )
      ),
    );
  }
}


class BlogTile extends StatelessWidget {

  final String imageUrl, title, desc, url;
  BlogTile({@required this.imageUrl, @required this.title, @required this.desc, @required this.url}) ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(
            builder: (context) => ArticleView(blogUrl:url)
          ));
        },
          child: Container(
        margin: EdgeInsets.only(bottom:16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl)
            ),
            SizedBox(height: 8,),
            Text(title, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,color:Colors.black87)),
            SizedBox(height: 8,),
            Text(desc, style: TextStyle(color:Colors.black54)),
          ],
          )
      ),
    );
  }
}
