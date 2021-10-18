import 'dart:convert';

import 'package:app/domain/goal/goal.dart';

class Target {
  final int? id;
  final double? lat;
  final double? lng;
  final int? objectiveWon;
  final int? currentWon;
  final String? imageUrl;
  final String? name;
  final String? desc;
  final List<Goal> goals;

  Target.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        lat = json["lat"],
        lng = json["lng"],
        objectiveWon = json["objective_won"],
        currentWon = json["current_won"],
        imageUrl = json["image_url"],
        name = json["name"],
        desc = json["description"],
        goals = decodeGoals(json["goals"]);

  static List<Goal> decodeGoals(List<dynamic> json) {
    return json.map((g) => Goal.fromJson(g)).toList();
  }
}

Target example = Target.fromJson({
  "id": 1,
  "lat": 37.1,
  "lng": 127.5,
  "image_url": "bench.png",
  "name": "53사단 벤치",
  "desc": "53사단 통신대대에서 연병장에 놓을 벤치를 설치하기 위해 모금중입니다!",
  "objective_won": 300000,
  "current_won": 250000
});
