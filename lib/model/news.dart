class News{
  String status;
  List<Article> articles;

  News({
    required this.status,
    required this.articles,
  });

  factory News.fromJson(Map<String,dynamic> json){
    return News(
      status: json['status'],
      articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );
  }
}

class Article{
  //String source;
  String author;
  String title;
  String description;
  String url;
  String content;
  String urlToImage;
  DateTime publishedAt;


 Article({
   required this.author,
   required this.title,
   required this.description,
   required this.url,
   required this.content,
   required this.urlToImage,
   required this.publishedAt,

 });

 factory Article.fromJson(Map<String,dynamic> json){
   return Article(
     author: json['author']== null ? "abebe" : json["author"],
     title: json['title']==null? "hello":json['title'],
     description:json['description']==null? "hello":json['description'],
     url: json['url']==null? "hello":json['url'],
     content: json['content']==null? "hello":json['content'],
     urlToImage: json['urlToIamge']==null? "hello":json['urlToImage'],
     publishedAt: DateTime.parse(json['publishedAt']),
   );
 }

}