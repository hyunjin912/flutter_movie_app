import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final Dio _dio;

  MovieDataSourceImpl(this._dio);

  @override
  Future<List<MovieResponseDto>> fetchMovies() async {
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/movie/popular',
        options: Options(
          validateStatus: (status) => true,
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMzMwNjBkMmY2YzZjZjExMDVjYTc4YTBmODM1MGEyMyIsIm5iZiI6MTY5NTQ1NTc3MC41OTksInN1YiI6IjY1MGU5YTFhZjI5ZDY2MDBmZjNiOTMwYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xMSwLr5HcBCw-jNevqFpkfhM3lp95D95DXNNltIQSvE',
          },
        ),
        queryParameters: {'language': 'ko-KR', 'page': 1},
      );

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
