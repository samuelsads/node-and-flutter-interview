
import 'dart:convert';

ArticlesModel articlesModelFromJson(String str) => ArticlesModel.fromJson(json.decode(str));

String articlesModelToJson(ArticlesModel data) => json.encode(data.toJson());

class ArticlesModel {
    bool? success;
    List<Article>? articles;
    String? msg;

    ArticlesModel({
        this.success,
        this.articles,
        this.msg,
    });

    factory ArticlesModel.fromJson(Map<String, dynamic> json) => ArticlesModel(
        success: json["success"],
        articles: json["articles"] == null ? [] : List<Article>.from(json["articles"]!.map((x) => Article.fromJson(x))),
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "articles": articles == null ? [] : List<dynamic>.from(articles!.map((x) => x.toJson())),
        "msg": msg,
    };
}

class Article {
    String? author;
    String? title;
    String? description;
    String? url;
    String? urlToImage;
    DateTime? publishedAt;
    String uid;

    Article({
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        required this.uid,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        uid: json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "uid": uid,
    };
}
