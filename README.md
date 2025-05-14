# Flutter 영화 정보 앱

## 📣 프로젝트 개요

TMDB API를 이용해 데이터를 가져오고,
클린 아키텍쳐 연습을 위한 개인 프로젝트입니다.

## 📆 프로젝트 일정

25/05/07 ~ 25/05/14

<br/>

<p float="left">
  <img src="https://github.com/user-attachments/assets/4d5019ef-da66-4832-8ce2-918ae74c4275" width="45%" />
  <img src="https://github.com/user-attachments/assets/06c7afa4-86a1-4adb-9b9a-274cc984dc00" width="45%" />
</p>


## 🚨 TroubleShooting

> [이미지 캐싱 문제](https://skyhyunjinlee.tistory.com/entry/TIL-034-%EC%98%81%ED%99%94-%EC%95%B1%EC%97%90%EC%84%9C-%ED%8A%B9%ED%9E%88-%EC%A4%91%EC%9A%94%ED%95%9C-%EC%9D%B4%EB%AF%B8%EC%A7%80-%EC%BA%90%EC%8B%B1-%EB%AC%B8%EC%A0%9C)

`문제상황` :

- 상세 페이지에서 메인 페이지로 되돌아오면 이미지 리로딩되는 현상

`해결과정` :

1. 플러터의 현재 메모리 캐시 용량을 파악
2. 메모리 캐시 용량을 증가하여 해결

<br/>

> [Hero위젯 중복 문제](https://skyhyunjinlee.tistory.com/entry/TIL-035-Flutter-Hero%EC%9C%84%EC%A0%AF-%EC%A4%91%EB%B3%B5-%EC%97%90%EB%9F%AC-%ED%95%B4%EA%B2%B0-%EB%B0%A9%EB%B2%95)

`문제상황` :

- tag가 같은 Hero위젯이 많아 애니메이션 처리가 안되는 상황 

`해결과정` :

1. 동일한 이미지일지라도 tag를 다르게 적용하여 해결

<br/>

## 💻 발전 시킬 부분

- [ ] 영상 추가
- [ ] 영화 검색 기능
