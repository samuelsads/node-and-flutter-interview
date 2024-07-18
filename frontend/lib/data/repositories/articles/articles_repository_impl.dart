
import 'package:frontend/data/entities/article.dart';
import 'package:frontend/data/remotes/articles/http_articles.dart';
import 'package:frontend/data/repositories/articles/articles_repository.dart';

class  ArticlesRepositoryImpl extends ArticlesRepository{

  final HttpArticles httpArticles;

  ArticlesRepositoryImpl({required this.httpArticles});
  @override
  Future<List<Article>> getAll() async=> await httpArticles.getAll();

}