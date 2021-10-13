class Donation {
  final int? id;
  final String? donorName;
  final String? message;
  final int? payWon;
  final int? targetId;
  Donation({
    this.id,
    this.donorName,
    this.message,
    this.payWon,
    this.targetId,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  Donation.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        donorName = json["donor_name"],
        message = json["message"],
        payWon = json["pay_won"],
        targetId = json["targetId"];
}
