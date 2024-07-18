
import 'dart:convert';

ArticleModel articleModelFromJson(String str) => ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) => json.encode(data.toJson());

class ArticleModel {
    bool success;
    Articles? articles;
    String? msg;

    ArticleModel({
        required this.success,
        this.articles,
        this.msg,
    });

    factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        success: json["success"],
        articles: json["articles"] == null ? null : Articles.fromJson(json["articles"]),
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "articles": articles?.toJson(),
        "msg": msg,
    };
}

class Articles {
    String? author;
    String? title;
    String? description;
    String? url;
    String? urlToImage;
    DateTime? publishedAt;
    String? uid;

    Articles({
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.uid,
    });

    factory Articles.fromJson(Map<String, dynamic> json) => Articles(
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
