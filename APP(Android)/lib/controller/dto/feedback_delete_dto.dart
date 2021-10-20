class FeedbackDeleteDTO {
  final int id;
  final String password;

  FeedbackDeleteDTO({
    required this.id,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "id": id.toString(),
        "password": password,
      };
}
