import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/news.dart';
class NewsController{
  
  Future<News> getNews() async{
    var news;
    try{
      var response =await http.get(Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2021-06-21&sortBy=publishedAt&apiKey=543b0862aae14026994402c20e08b9bb'));

    if(response.statusCode==200){
      var jsonData=json.decode(response.body);
      news =News.fromJson(jsonData);
    }
    print(response.body);
    return news;
    } catch(Exception){
      print(Exception.toString());
    }
    return news;
  }
}