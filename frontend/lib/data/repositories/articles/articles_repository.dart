

import 'package:frontend/data/entities/article.dart';

abstract class ArticlesRepository{
   Future<List<Article>> getAll();
}