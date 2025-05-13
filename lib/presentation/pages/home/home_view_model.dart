import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:flutter_movie_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  List<Movie>? popular;

  HomeState({this.popular});

  HomeState copywith({List<Movie>? popular}) {
    return HomeState(popular: popular ?? this.popular);
  }
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  build() {
    fetchPopularMovies();
    return HomeState();
  }

  Future<void> fetchPopularMovies() async {
    final fetchPopularMoviesUsecase = ref.read(
      fetchPopularMoviesUsecaseProvider,
    );
    final result = await fetchPopularMoviesUsecase.execute();
    state = state.copywith(popular: result);
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
