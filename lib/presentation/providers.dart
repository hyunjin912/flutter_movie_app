import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source_impl.dart';
import 'package:flutter_movie_app/data/repository/movie_repository_impl.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
✅✅✅✅✅✅✅✅✅✅
viewModel에서는 usecase를 사용하므로 usecase에게 의존성이 있다

근데, usecase의 FetchPopularMoviesUsecase 클래스를 사용하기 위해서는
인자가 필요하고, usecase클래스의 내부에서 사용되는 repository클래스도
인자가 필요하고, repository클래스의 내부에서 사용되는 dataSource클래스도
인자가 필요하다.

usecase => FetchPopularMoviesUsecase(_movieRepository) 
  repository => MovieRepositoryImpl(_movieDataSource)
    data_source =>MovieDataSourceImpl(_dio)

그럼 결국 viewModel에서 usecase를 사용하기 위해
_movieRepository,
_movieDataSource,
_dio 라는 ✅3개의 객체를 한 번에 생성해서 인자로 넘겨워야 하므로 메모리에 좋지 못하다✅
그래서 3개의 객체가 ✅각각 필요한 순간에만 생성해서 메모리에 저장이 되게 하는 것이 효율적이다✅

결국 providers.dart는
viewmodel에서 직접 객체를 생성하지 않도록 하기 위해 필요한 파일이다
1. 이 파일에서 usecase 공급해주는 Provider 생성하고
2. viewmodel 내에서는 Provider에 의해서 usecase 공급 받을 것이다
*/

// ✅ Privider<T>
// T를 명시하지 않으면 return 하는 값이 T가 된다
// MovieDataSourceImpl는 MovieDataSource의 서브클래스이므로
// T에 슈퍼클래스인 MovieDataSource를 명시해도 호환이 된다
// ✅ ref.read(movieDataSourceProvider)의 값은 MovieDataSourceImpl의 인스턴스이지만
// ✅ 이 인스턴스는 슈퍼클래스인 MovieDataSource의 타입도 될 수 있으니 호환이 된다
// 즉 MovieDataSource data = MovieDataSourceImpl(Dio()); 라고 선언과 초기화를 해도
// 된다는 말이다

final _movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  return MovieDataSourceImpl(Dio());
});

final _movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dataSource = ref.read(_movieDataSourceProvider);
  return MovieRepositoryImpl(dataSource);
});

final fetchPopularMoviesUsecaseProvider = Provider((ref) {
  final repository = ref.read(_movieRepositoryProvider);
  return FetchPopularMoviesUsecase(repository);
});

final fetchNowPlayingMoviesUsecaseProvider = Provider((ref) {
  final repository = ref.read(_movieRepositoryProvider);
  return FetchNowPlayingMoviesUsecase(repository);
});
