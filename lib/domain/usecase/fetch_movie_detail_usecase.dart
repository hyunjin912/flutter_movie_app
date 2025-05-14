import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class FetchMovieDetailUsecase {
  final MovieRepository _movieRepository;

  FetchMovieDetailUsecase(this._movieRepository);

  Future<MovieDetail> execute(int id) async {
    return _movieRepository.fetchMovieDetail(id);
  }
}
