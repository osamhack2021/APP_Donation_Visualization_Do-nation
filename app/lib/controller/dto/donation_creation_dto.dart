class DonationCreationDTO {
  final String donorName;
  final String message;
  final String phone;
  final int payWon;
  final String password;
  int targetId = -1;

  DonationCreationDTO({
    required this.donorName,
    required this.message,
    required this.phone,
    required this.payWon,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "donor_name": donorName,
        "message": message,
        "phone": phone,
        "pay_won": payWon.toString(),
        "password": password,
        "targetId": targetId.toString(),
      };
}
