import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class FetchTopRatedMoviesUsecase {
  final MovieRepository _movieRepository;

  FetchTopRatedMoviesUsecase(this._movieRepository);

  Future<List<Movie>> execute() async {
    return _movieRepository.fetchTopRatedMovies();
  }
}
