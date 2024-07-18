import 'package:frontend/data/entities/article.dart';
import 'package:frontend/data/models/articles_modal.dart' as AM;

class ArticlesMapper {
  static Article article(AM.Article a) => Article(
      author: a.author ?? "No information",
      title: a.title ?? "No information",
      description: a.description ?? "No information",
      url: a.url ?? "empty",
      urlToImage:a.urlToImage??
          "https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-imagen-no-encontrada-ilustración-vectorial.jpg",
      publishedAt: a.publishedAt ?? DateTime.now(),
      uid: a.uid);
}
