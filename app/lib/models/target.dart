const _urlPrefix = "";

class Target {
  final String imageUrl;
  final String name;
  final String desc;
  final int objectiveWon;
  final int currentWon;

  Target(
      {required this.imageUrl,
      required this.name,
      required this.desc,
      required this.objectiveWon,
      required this.currentWon});
}

Target example = Target(
  imageUrl: "${_urlPrefix}bench.png",
  name: "53사단 벤치",
  desc: "53사단 통신대대에서 연병장에 놓을 벤치를 설치하기 위해 모금중입니다!",
  objectiveWon: 300000,
  currentWon: 230000,
);
