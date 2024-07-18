

import 'package:frontend/data/entities/article.dart';

abstract class HttpArticles{
  Future<List<Article>> getAll();
}