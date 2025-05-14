import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';

/// API 요청 path parameter
class Tmdb {
  static final popular = '/popular';
  static final nowPlaying = '/now_playing';
  static final topRated = '/top_rated';
  static final upcoming = '/upcoming';
}

/// data source 구현 클래스
class MovieDataSourceImpl implements MovieDataSource {
  late Dio _dio;

  MovieDataSourceImpl(Dio dio) {
    _dio = dio;
    _dio.options = BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/movie',
      validateStatus: (status) => true,
      headers: {'Authorization': 'Bearer ${dotenv.env['TMDB_API_KEY']}'},
      queryParameters: {'language': 'ko-KR', 'page': 1},
    );
  }

  @override
  Future<List<MovieResponseDto>> fetchPopularMovies() async {
    try {
      final response = await _dio.get(Tmdb.popular);

      if (response.statusCode == 200) {
        final results = List.from(response.data['results']);
        final movieList =
            results.map((e) => MovieResponseDto.fromJson(e)).toList();
        return movieList;
      }
      return [];
    } catch (e, s) {
      print(e);
      print(s);
      return [];
    }
  }

  @override
  Future<List<MovieResponseDto>> fetchNowPlayingMovies() async {
    try {
      final response = await _dio.get(Tmdb.nowPlaying);

      if (response.statusCode == 200) {
        final results = List.from(response.data['results']);
        final movieList =
            results.map((e) => MovieResponseDto.fromJson(e)).toList();
        return movieList;
      }
      return [];
    } catch (e, s) {
      print(e);
      print(s);
      return [];
    }
  }

  @override
  Future<List<MovieResponseDto>> fetchTopRatedMovies() async {
    try {
      final response = await _dio.get(Tmdb.topRated);

      if (response.statusCode == 200) {
        final results = List.from(response.data['results']);
        final movieList =
            results.map((e) => MovieResponseDto.fromJson(e)).toList();
        return movieList;
      }
      return [];
    } catch (e, s) {
      print(e);
      print(s);
      return [];
    }
  }

  @override
  Future<List<MovieResponseDto>> fetchUpcomingMovies() async {
    try {
      final response = await _dio.get(Tmdb.upcoming);

      if (response.statusCode == 200) {
        final results = List.from(response.data['results']);
        final movieList =
            results.map((e) => MovieResponseDto.fromJson(e)).toList();
        return movieList;
      }
      return [];
    } catch (e, s) {
      print(e);
      print(s);
      return [];
    }
  }

  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    try {
      final response = await _dio.get('/$id');

      if (response.statusCode == 200) {
        final result = response.data;
        return MovieDetailDto.fromJson(result);
      }
      return null;
    } catch (e, s) {
      print(e);
      print(s);
      return null;
    }
  }
}
