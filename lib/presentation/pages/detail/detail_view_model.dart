import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailViewModel extends Notifier<MovieDetail?> {
  @override
  build() {
    return null;
  }

  Future<MovieDetail> fetchMovieDetail(int id) async {
    final fetchMovieDetailUsecase = ref.read(fetchMovieDetailUsecaseProvider);
    return await fetchMovieDetailUsecase.execute(id);
  }
}

final detailViewModelProvider = NotifierProvider<DetailViewModel, MovieDetail?>(
  () {
    return DetailViewModel();
  },
);
