import 'package:app/view/components/common/drawing.dart';

class Donation {
  final int? id;
  final String? donorName;
  final String? message;
  final int? payWon;
  final int? targetId;
  final double? x1Coord;
  final double? y1Coord;
  final double? x2Coord;
  final double? y2Coord;
  Donation({
    this.id,
    this.donorName,
    this.message,
    this.payWon,
    this.targetId,
    this.x1Coord,
    this.y1Coord,
    this.x2Coord,
    this.y2Coord,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  Donation.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        donorName = json["donor_name"],
        message = json["message"],
        payWon = json["pay_won"],
        targetId = json["targetId"],
        x1Coord = json["x1_coord"],
        y1Coord = json["y1_coord"],
        x2Coord = json["x2_coord"],
        y2Coord = json["y2_coord"];

  CustomPoint get p1 => CustomPoint(x1Coord ?? 0, y1Coord ?? 0);
  CustomPoint get p2 => CustomPoint(x2Coord ?? 0, y2Coord ?? 0);
}
