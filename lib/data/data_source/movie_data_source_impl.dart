import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';

class Tmdb {
  static final popular = '/popular';
  static final nowPlaying = '/now_playing';
  static final topRated = '/top_rated';
  static final upcoming = '/upcoming';
}

class MovieDataSourceImpl implements MovieDataSource {
  late Dio _dio;

  MovieDataSourceImpl(Dio dio) {
    _dio = dio;
    _dio.options = BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/movie',
      validateStatus: (status) => true,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMzMwNjBkMmY2YzZjZjExMDVjYTc4YTBmODM1MGEyMyIsIm5iZiI6MTY5NTQ1NTc3MC41OTksInN1YiI6IjY1MGU5YTFhZjI5ZDY2MDBmZjNiOTMwYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xMSwLr5HcBCw-jNevqFpkfhM3lp95D95DXNNltIQSvE',
      },
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
}
