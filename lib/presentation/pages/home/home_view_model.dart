import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:flutter_movie_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  List<Movie>? popular;
  List<Movie>? nowPlaying;

  HomeState({this.popular, this.nowPlaying});

  HomeState copywith({List<Movie>? popular, List<Movie>? nowPlaying}) {
    return HomeState(
      popular: popular ?? this.popular,
      nowPlaying: nowPlaying ?? this.nowPlaying,
    );
  }
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  build() {
    // fetchPopularMovies();
    // fetchNowPlayingMovies();
    fetchAll();
    return HomeState();
  }

  Future<void> fetchAll() async {
    print('fetchAll');
    final popular = await fetchPopularMovies();
    final nowPlaying = await fetchNowPlayingMovies();
    state = HomeState(popular: popular, nowPlaying: nowPlaying);
  }

  Future<List<Movie>> fetchPopularMovies() async {
    final fetchPopularMoviesUsecase = ref.read(
      fetchPopularMoviesUsecaseProvider,
    );
    return await fetchPopularMoviesUsecase.execute();
    // state = state.copywith(popular: result);
  }

  Future<List<Movie>> fetchNowPlayingMovies() async {
    final fetchNowPlayingMoviesUsecase = ref.read(
      fetchNowPlayingMoviesUsecaseProvider,
    );
    return await fetchNowPlayingMoviesUsecase.execute();
    // state = state.copywith(nowPlaying: result);
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
