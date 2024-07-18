


import 'package:dio/dio.dart';
import 'package:frontend/data/entities/article.dart';
import 'package:frontend/data/mappers/articles/articles_mapper.dart';
import 'package:frontend/data/models/articles_modal.dart' as AM;
import 'package:frontend/data/remotes/articles/http_articles.dart';

class HttpArticlesImpl extends HttpArticles{

  //IOS
  final _dio  = Dio(BaseOptions(baseUrl: "http://localhost:3000/api/articles"));
  
  //ANDROID
  //final _dio  = Dio(BaseOptions(baseUrl: "http://10.0.2.2:3000/api/articles"));

  @override
  Future<List<Article>> getAll()async {
    List<Article> response  =[];
    AM.ArticlesModel articles;
    try {
      final resp  = await  _dio.get("/all");
      articles  = AM.ArticlesModel.fromJson(resp.data);
      response  = (articles.articles??[]).map((e)=>ArticlesMapper.article(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
    return response;
  }
}