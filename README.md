# 쇼:뷰 | Show:View🎆
<img alt = "쇼뷰로고" src="https://github.com/nodb/FestivalMap/assets/71473708/ead7612d-2e25-4912-89bd-da4f14b0d825" width="200">

## ✍ Project Introduction
**"쇼:뷰"** 은 **Flutter**와 **Dart**를 이용한 국내 공연에 대한 정보를 가져오는 애플리케이션으로 공연에 대한 리스트 페이지 기능과 상세 페이지 기능을 제공합니다.

## 🗂️ Project Structure
프로젝트 Show:View의 'main' branch 디렉토리 구조입니다.

**📁 /lib**
```
📄 main.dart
Show:View 메인 파일
```
**📁 /lib/models**
```
📄 show_detail_model.dart
상세 페이지의 fetch 내용 구성파일
api_server.dart로부터 받은 정보 저장

📄 show_model.dart
메인 페이지의 fetch 내용 구성파일
api_server.dart로부터 받은 정보 저장
```
**📁 /lib/screens**
```
📄 detail_screen.dart
상세 페이지 화면 구성요소
좋아요 기능(로컬 데이터 저장)
shared_preferences 패키지를 통해 구현

📄 home_screen.dart
메인 페이지 화면 구성요소
```
**📁 /lib/services**
```
📄 api_service.dart
공연 API를 통해 파싱한 정보(id, title, startDate, endDate, location, img, genre, state, openrun)를 map으로
각 요소를 show_detail_model.dart, show_model.dart에 전달
http 패키지를 통해 구현
```
**📁 /lib/widgets**
```
📄 show_widget.dart
화면 구성요소 위젯
```

## 📦 Package
- [http 1.1.2 | pub.dev](https://pub.dev/packages/http)

- [shared_preferences 2.2.2 | pub.dev](https://pub.dev/packages/shared_preferences)

### install
```
flutter pub add http
flutter pub add shared_preferences
```

## 🔗 Reference
- [codingapple | Flutter 설치](https://codingapple.com/unit/flutter-install-on-windows-and-mac/) - 플러터 개발 환경 및 설치
- [velog.io | doctor error](https://velog.io/@oen/flutter-doctor-%EC%97%90%EB%9F%AC) - 플러터 doctor 오류 참고
- [velog.io | Widget 이론](https://velog.io/@ho-taek/Flutter-%EC%9C%84%EC%A0%AF%EC%9D%84-%EC%95%8C%EC%95%84%EB%B3%B4%EC%9E%90) - 플러터 위젯 방식 참고
- [velog.io | Plutter Http](https://velog.io/@tygerhwang/Flutter-Http-%ED%86%B5%EC%8B%A0-Rest-API-%ED%98%B8%EC%B6%9C%ED%95%98%EA%B8%B0-1%ED%8E%B8-Http) - 플러터 Http 통신
- [colinch4.github.io | Flutter Rest API](https://colinch4.github.io/2023-12-12/10-15-20-001354-%ED%94%8C%EB%9F%AC%ED%84%B0%EC%99%80-restful-api-%ED%86%B5%EC%8B%A0-%EB%B0%A9%EB%B2%95/) - 플러터 REST API
- [tistory | Hero](https://altongmon.tistory.com/1015) - 플러터 애니메이션 위젯(Hero)
- [tistory | SharedPreferences](https://newland435.tistory.com/102) - 플러터 저장 패키지(SharedPreferences)

## ‍💻 Developer

| 학과         | 학번     | 이름   |
| ------------ | -------- | ------ |
| 컴퓨터공학과 | 19101216 | 노다빈 |

## 💳 License

이 프로젝트는 MIT 라이선스로 배포됩니다.  
상세한 라이선스 정보는 [LICENSE](https://github.com/nodb/MoblieProgramming/blob/main/LICENSE.txt) 파일에서 확인할 수 있습니다.
