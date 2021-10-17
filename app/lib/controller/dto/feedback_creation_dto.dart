class FeedbackCreationDTO {
  final String name;
  final String message;
  final String password;
  final String? imageUrl;
  int targetId = -1;

  FeedbackCreationDTO({
    required this.name,
    required this.message,
    required this.password,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      "name": name,
      "message": message,
      "password": password,
      "targetId": targetId.toString(),
    };
    if (imageUrl != null) {
      json.addAll({"image_url": imageUrl});
    }

    return json;
  }
}
