class DonationDeleteDTO {
  final String donorName;
  final String phone;
  final String password;
  final int targetId;

  DonationDeleteDTO({
    required this.donorName,
    required this.phone,
    required this.password,
    required this.targetId,
  });

  Map<String, dynamic> toJson() => {
        "donor_name": donorName,
        "phone": phone,
        "password": password,
        "targetId": targetId,
      };
}
