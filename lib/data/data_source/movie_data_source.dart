import 'package:flutter_movie_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';

abstract interface class MovieDataSource {
  /// 인기 영화 목록 가져오기
  Future<List<MovieResponseDto>> fetchPopularMovies();

  /// 현재 상영중인 영화 목록 가져오기
  Future<List<MovieResponseDto>> fetchNowPlayingMovies();

  /// 평점 높은 순으로 영화 목록 가져오기
  Future<List<MovieResponseDto>> fetchTopRatedMovies();

  /// 개봉 예정인 영화 목록 가져오기
  Future<List<MovieResponseDto>> fetchUpcomingMovies();

  /// 해당 영화의 자세한 정보 가져오기
  Future<MovieDetailDto?> fetchMovieDetail(int id);
}
