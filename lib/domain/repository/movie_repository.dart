import 'package:flutter_movie_app/domain/entity/movie.dart';

abstract interface class MovieRepository {
  Future<List<Movie>> fetchPopularMovies();
  Future<List<Movie>> fetchNowPlayingMovies();
  Future<List<Movie>> fetchTopRatedMovies();
  Future<List<Movie>> fetchUpcomingMovies();
}
