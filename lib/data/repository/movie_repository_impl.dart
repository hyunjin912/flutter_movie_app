import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  // ✅ MovieDataSource라는 인터페이스를 할당
  // ✅ 그래야 의존성이 끊김
  // ✅ 인터페이스를 구현하는 클래스를 할당하면 안됨
  final MovieDataSource _movieDataSource;

  MovieRepositoryImpl(this._movieDataSource);

  @override
  Future<List<Movie>> fetchPopularMovies() async {
    // ✅ 1. 서버와 통신하여 데이터를 가져온다
    // ✅ 서버와 통신하는 부분은 data layer의 data_source이다.
    final movieResponseDtoList = await _movieDataSource.fetchPopularMovies();

    // ✅ 2. 가져온 데이터를 entity의 모델 클래스를 이용해
    // ✅ 객체를 생성하여 반환
    List<Movie> movies =
        movieResponseDtoList
            .map((e) => Movie(id: e.id, posterPath: e.posterPath))
            .toList();

    return movies;
  }
}
