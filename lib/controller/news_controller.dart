import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/news.dart';
class NewsController{
  
  Future<News> getNews() async{
    var news;
    try{
      var response =await http.get(Uri.parse('your API'));

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
