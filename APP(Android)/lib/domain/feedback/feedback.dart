class Feedback {
  final int? id;
  final String? name;
  final String? message;
  final int? targetId;
  final String? imageUrl;
  Feedback({
    this.id,
    this.name,
    this.message,
    this.targetId,
    this.imageUrl,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  Feedback.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        message = json["message"],
        targetId = json["targetId"],
        imageUrl = json["image_url"];

  bool hasImage() => imageUrl != null;
}
