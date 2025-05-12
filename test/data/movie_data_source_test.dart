import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  MockDio? mockDio;
  MovieDataSourceImpl? dataSource;

  setUp(() {
    mockDio = MockDio();
    dataSource = MovieDataSourceImpl(mockDio!);
  });

  test('MovieDataSource Test', () async {
    final dommyFile = File('test/dummy/popular.json');

    final jsonMap = jsonDecode(await dommyFile.readAsString());

    final response = Response<Map<String, dynamic>>(
      data: jsonMap,
      statusCode: 200,
      requestOptions: RequestOptions(path: '/movie'), // 실제 path는 테스트 상황에 맞게
    );

    when(() {
      // ✅ 포지셔널 파라미터는 any()
      // ✅ 네임드 파라미터는 any(named: '파라미터') 로 사용해야 한다.
      return mockDio!.get(
        any(),
        options: any(named: 'options'),
        queryParameters: any(named: 'queryParameters'),
      );
    }).thenAnswer((invocation) async {
      return response;
    });

    final results = await dataSource!.fetchPopularMovies();

    expect(results.length, 20);
    expect(results.first.originalTitle, 'Warfare');
    expect(results.first.title, '워페어');
  });
}
