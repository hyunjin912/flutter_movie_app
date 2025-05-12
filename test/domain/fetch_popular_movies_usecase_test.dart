import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  MockMovieRepository? mockMovieRepository;
  FetchPopularMoviesUsecase? fetchPopularMoviesUsecase;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    fetchPopularMoviesUsecase = FetchPopularMoviesUsecase(mockMovieRepository!);
  });

  test('FetchPopularMoviesUsecase Test : fetchPopularMovies', () async {
    when(() {
      return mockMovieRepository!.fetchPopularMovies();
    }).thenAnswer((invocation) async {
      return [Movie(id: 123, posterPath: 'posterPath')];
    });

    final result = await fetchPopularMoviesUsecase!.execute();

    expect(result.length, 1);
    expect(result.first.id, 123);
    expect(result.first.posterPath, 'posterPath');
  });
}
