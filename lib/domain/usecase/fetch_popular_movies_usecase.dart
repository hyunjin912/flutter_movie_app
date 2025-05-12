import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class FetchPopularMoviesUsecase {
  final MovieRepository _movieRepository;

  FetchPopularMoviesUsecase(this._movieRepository);

  Future<List<Movie>> execute() async {
    return _movieRepository.fetchPopularMovies();
  }
}
