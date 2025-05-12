import 'dart:convert';

import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('MovieResponseDto Test', () {
    final movieJson = r'''
{
  "adult": false,
  "backdrop_path": "/cJvUJEEQ86LSjl4gFLkYpdCJC96.jpg",
  "genre_ids": [
    10752,
    28
  ],
  "id": 1241436,
  "original_language": "en",
  "original_title": "Warfare",
  "overview": "\"실화 기반, 전장의 숨결을 생생히 담아낸 리얼 타임 전쟁 드라마\"  2006년 이라크 라마디. 미 해군 특수부대 네이비 씰 팀이 적진 한복판에서 감시 임무를 수행하던 중, 예상치 못한 상황에 휘말리게 된다. 민가를 점거해 잠복하던 그들은 알카에다 세력의 포위망에 갇히고, 지원은 끊긴 채 생존을 위한 사투를 벌이게 된다. 전직 네이비 씰이자 실제 생존자인 레이 멘도자 감독과 '엑스 마키나', '시빌 워'의 알렉스 가란드 감독이 공동 연출한 이 작품은, 전투의 혼돈과 공포를 실시간으로 그려낸다. 화려한 음악이나 영웅 서사 없이, 전장의 소음과 침묵, 그리고 병사들의 숨결이 화면을 가득 채운다. 실화를 바탕으로 한 이 영화는, 전쟁의 참혹함과 인간의 생존 본능을 적나라하게 보여주며, 관객을 전장의 한가운데로 끌어들인다. 과연 이들은 살아남을 수 있을까...",
  "popularity": 524.0776,
  "poster_path": "/j8tqBXwH2PxBPzbtO19BTF9Ukbf.jpg",
  "release_date": "2025-04-09",
  "title": "워페어",
  "video": false,
  "vote_average": 7.223,
  "vote_count": 197
}
''';

    final movieMap = jsonDecode(movieJson);
    final movieResponseDto = MovieResponseDto.fromJson(movieMap);

    expect(movieResponseDto.adult, false);
    expect(movieResponseDto.backdropPath, "/cJvUJEEQ86LSjl4gFLkYpdCJC96.jpg");
    expect(movieResponseDto.genreIds, [10752, 28]);
    expect(movieResponseDto.id, 1241436);
    expect(movieResponseDto.originalLanguage, "en");
    expect(movieResponseDto.originalTitle, "Warfare");
    expect(
      movieResponseDto.overview,
      "\"실화 기반, 전장의 숨결을 생생히 담아낸 리얼 타임 전쟁 드라마\"  2006년 이라크 라마디. 미 해군 특수부대 네이비 씰 팀이 적진 한복판에서 감시 임무를 수행하던 중, 예상치 못한 상황에 휘말리게 된다. 민가를 점거해 잠복하던 그들은 알카에다 세력의 포위망에 갇히고, 지원은 끊긴 채 생존을 위한 사투를 벌이게 된다. 전직 네이비 씰이자 실제 생존자인 레이 멘도자 감독과 '엑스 마키나', '시빌 워'의 알렉스 가란드 감독이 공동 연출한 이 작품은, 전투의 혼돈과 공포를 실시간으로 그려낸다. 화려한 음악이나 영웅 서사 없이, 전장의 소음과 침묵, 그리고 병사들의 숨결이 화면을 가득 채운다. 실화를 바탕으로 한 이 영화는, 전쟁의 참혹함과 인간의 생존 본능을 적나라하게 보여주며, 관객을 전장의 한가운데로 끌어들인다. 과연 이들은 살아남을 수 있을까...",
    );
    expect(movieResponseDto.popularity, 524.0776);
    expect(movieResponseDto.posterPath, "/j8tqBXwH2PxBPzbtO19BTF9Ukbf.jpg");
    expect(movieResponseDto.releaseDate, "2025-04-09");
    expect(movieResponseDto.title, "워페어");
    expect(movieResponseDto.video, false);
    expect(movieResponseDto.voteAverage, 7.223);
    expect(movieResponseDto.voteCount, 197);
  });
}
