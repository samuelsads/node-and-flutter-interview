import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/data/entities/article.dart';
import 'package:frontend/data/repositories/articles/articles_repository.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final ArticlesRepository _articlesRepository;

  ArticlesBloc(this._articlesRepository) : super(const ArticlesState()) {
    on<GetAllArticlesEvent>(
      (event, emit) => emit(state.copyWith(
          articles: event.articles, articlesStatus: event.articlesStatus)),
    );
  }

  Future<void> getAll() async {

     add(const GetAllArticlesEvent(
            articlesStatus: ArticlesStatus.loading));
    try {
      final response = await _articlesRepository.getAll();
      if (response.isEmpty) {
        add(const GetAllArticlesEvent(
            articlesStatus: ArticlesStatus.error, errorText: "Data is empty"));
        return;
      }
      add(GetAllArticlesEvent(
          articlesStatus: ArticlesStatus.success, articles: response));
    } catch (e) {
      add(GetAllArticlesEvent(
          articlesStatus: ArticlesStatus.error, errorText: e.toString()));
    }
  }
}
