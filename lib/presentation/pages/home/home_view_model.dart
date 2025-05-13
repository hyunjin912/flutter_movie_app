import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:flutter_movie_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  List<Movie>? popular;
  List<Movie>? nowPlaying;
  List<Movie>? topRated;
  List<Movie>? upcoming;

  HomeState({this.popular, this.nowPlaying, this.topRated, this.upcoming});

  HomeState copywith({
    List<Movie>? popular,
    List<Movie>? nowPlaying,
    List<Movie>? topRated,
    List<Movie>? upcoming,
  }) {
    return HomeState(
      popular: popular ?? this.popular,
      nowPlaying: nowPlaying ?? this.nowPlaying,
      topRated: topRated ?? this.topRated,
      upcoming: upcoming ?? this.upcoming,
    );
  }
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  build() {
    fetchAll();
    return HomeState();
  }

  Future<void> fetchAll() async {
    print('fetchAll');
    final popular = await fetchPopularMovies();
    final nowPlaying = await fetchNowPlayingMovies();
    final topRated = await fetchTopRatedMovies();
    final upcoming = await fetchUpcomingMovies();
    state = HomeState(
      popular: popular,
      nowPlaying: nowPlaying,
      topRated: topRated,
      upcoming: upcoming,
    );
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

  Future<List<Movie>> fetchTopRatedMovies() async {
    final fetcTopRatedMoviesUsecase = ref.read(
      fetchTopRatedMoviesUsecaseProvider,
    );
    return await fetcTopRatedMoviesUsecase.execute();
    // state = state.copywith(nowPlaying: result);
  }

  Future<List<Movie>> fetchUpcomingMovies() async {
    final fetchUpcomingMoviesUsecase = ref.read(
      fetchUpcomingMoviesUsecaseProvider,
    );
    return await fetchUpcomingMoviesUsecase.execute();
    // state = state.copywith(nowPlaying: result);
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
