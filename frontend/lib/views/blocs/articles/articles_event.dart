part of 'articles_bloc.dart';

class ArticlesEvent extends Equatable {
  const ArticlesEvent();

  @override
  List<Object> get props => [const GetAllArticlesEvent()];
}

class GetAllArticlesEvent extends ArticlesEvent {
  final List<Article>? articles;
  final ArticlesStatus? articlesStatus;
  final String?errorText;
  const GetAllArticlesEvent({this.articles, this.articlesStatus, this.errorText});
}
