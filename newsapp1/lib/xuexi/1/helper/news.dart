import 'dart:convert';
import 'package:newsapp1/xuexi/1/models/article_model.dart';
import 'package:http/http.dart' as http;
class News{

  List<ArticleModel> news =[];
  Future<void> getNews(String catOfNews) async{
    
    // String url ='https://gnewsapi.net/api/search?q=covid-19&language=vi&country=vn&api_token=[API TOKEN]';
    // String url ='http://webhose.io/filterWebContent?token=[YOUR_API_KEY]&q=site_type:news%20country:VN';
    String url ='https://newsapi.org/v2/top-headlines?country=us&category=$catOfNews&apiKey=5e730409c7fd491f8ff44385e8c55840';
    // String url ='https://newsapi.org/v2/top-headlines?country=us&category=entertainment&apiKey=5e730409c7fd491f8ff44385e8c55840';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    // if(jsonData['status'] == 'ok'){
      // jsonData['articles'].forEach((element){
      //   if(element['image-url'] != null && element['description'] != null){
      //     ArticleModel articleModel = ArticleModel(
      //       title: element['title'],
      //       // author: element['author'],
      //       description: element['description'],
      //       url: element["article-url"],
      //       urlToImage: element['image-url'],
      //       // publishedAt: DateTime.parse(element['publishedAt']),
      //       // content: element["content"],
      //     );  
      //   news.add(articleModel);
      // }});
    // }
    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element["url"],
            urlToImage: element['urlToImage'],
            // publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
          );  
        news.add(articleModel);
      }});
    }
  }
 
}


// class NewsForCategory {

//   List<ArticleModel> news  = [];

//   Future<void> getNewsForCategory(String category) async{

//     /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
//     String url ='https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=5e730409c7fd491f8ff44385e8c55840';
//     // String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=${apiKey}";

//     var response = await http.get(url);

//     var jsonData = jsonDecode(response.body);

//     if(jsonData['status'] == "ok"){
//       jsonData["articles"].forEach((element){

//         if(element['urlToImage'] != null && element['description'] != null){
//           ArticleModel article = ArticleModel(
//             title: element['title'],
//             author: element['author'],
//             description: element['description'],
//             urlToImage: element['urlToImage'],
//             // publshedAt: DateTime.parse(element['publishedAt']),
//             content: element["content"],
//             // articleUrl: element["url"],
//           );
//           news.add(article);
//         }

//       });
//     }


//   }
// }