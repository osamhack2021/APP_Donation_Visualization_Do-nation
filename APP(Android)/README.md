## 서버와 연동 방법

프론트엔드 앱만을 구동하고자 한다면 현재 유지중인 donationvisualization.ml 서버를 사용할 수 있다.  
그러나 직접 구동하는 서버를 사용하고자 한다면 프론트엔드 앱을 빌드하기 전에 서버 주소를 입력해주어야한다.  
lib/util/get_server_url.dart 파일의 1번줄을 수정한다.

```dart
const String serverUrl = "https://donationvisualization.ml";
```

**http, https를 붙이지 않는 경우 정상적으로 데이터 송수신이 이루어지지 않는다.**  
**웹은 https를 사용하면서 서버 주소를 http로 둔다면 mixed content error가 발생하므로 주의한다.**

## Flutter 설치

[Flutter 공식 홈페이지](https://flutter.dev/docs/get-started/install/linux) 참조

```bash
$ sudo snap install flutter --classic
```

군 내에서 개발을 위해 안드로이드 에뮬레이터 사용이 제한되어 웹버전으로 빌드한 뒤  
개발자 도구를 통해 해상도를 iphone X으로 고정해두고 개발했다.

### 디버그 모드로 빌드

```bash
 $ flutter run -d web-server --web-hostname=0.0.0.0
```

### 실제 배포할 버전 빌드

```bash
$ flutter build web
```

APP(Android)/build/web 폴더의 결과를 APP(BE)/server/flutter-app 내부에 옮긴 뒤 서버를 빌드하면  
Express 서버의 root dir을 통해 flutter app을 호스팅할 수 있다.
