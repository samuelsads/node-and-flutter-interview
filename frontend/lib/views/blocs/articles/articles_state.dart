part of 'articles_bloc.dart';

enum ArticlesStatus { initial, loading, success, error, done }

class ArticlesState extends Equatable {
  final List<Article>? articles;
  final ArticlesStatus articlesStatus  ;
  final String? errorText;

  const ArticlesState({this.articles, this.articlesStatus = ArticlesStatus.initial, this.errorText});

  ArticlesState copyWith(
          {List<Article>? articles, ArticlesStatus? articlesStatus, String? errorText}) =>
      ArticlesState(
          articles: articles ?? this.articles,
          articlesStatus: articlesStatus ?? this.articlesStatus, errorText: errorText?? this.errorText );

  @override
  List<Object?> get props => [articles, articlesStatus, errorText];
}

extension ArticlesStateX on ArticlesState {
  bool get errorArticle => articlesStatus == ArticlesStatus.error;
  bool get initialArticle => articlesStatus == ArticlesStatus.initial;
  bool get successArticle => articlesStatus == ArticlesStatus.success;
  bool get loadingArticle => articlesStatus == ArticlesStatus.loading;
  bool get doneArticle => articlesStatus == ArticlesStatus.done;
}
