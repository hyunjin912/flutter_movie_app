import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';

abstract interface class MovieDataSource {
  Future<List<MovieResponseDto>> fetchPopularMovies();
}
