class Goal {
  final int? id;
  final String? goal;
  final int? objectiveWon;
  final int? targetId;

  Goal.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        goal = json["goal"],
        objectiveWon = json["objective_won"],
        targetId = json["targetId"];
}
