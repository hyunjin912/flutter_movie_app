import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';
import 'package:flutter_movie_app/data/repository/movie_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieDataSource extends Mock implements MovieDataSource {}

void main() {
  MockMovieDataSource? mockMovieDataSource;
  MovieRepositoryImpl? movieRepositoryImpl;

  setUp(() {
    mockMovieDataSource = MockMovieDataSource();
    movieRepositoryImpl = MovieRepositoryImpl(mockMovieDataSource!);
  });

  test('MovieRepositoryImpl Test : fetchPopularMovies', () async {
    when(() {
      return mockMovieDataSource!.fetchPopularMovies();
    }).thenAnswer((invocation) async {
      return [
        MovieResponseDto(
          adult: false,
          backdropPath: 'backdropPath',
          genreIds: [123, 45],
          id: 123456789,
          originalLanguage: 'originalLanguage',
          originalTitle: 'originalTitle',
          overview: 'overview',
          popularity: 123,
          posterPath: 'posterPath',
          releaseDate: 'releaseDate',
          title: 'title',
          video: false,
          voteAverage: 123,
          voteCount: 123,
        ),
      ];
    });

    final result = await movieRepositoryImpl!.fetchPopularMovies();

    expect(result.first.id, 123456789);
    expect(result.first.posterPath, 'posterPath');
  });
}
