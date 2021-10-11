import 'package:app/controller/donation_controller.dart';
import 'package:app/controller/dto/donation_creation_dto.dart';
import 'package:app/domain/target/target.dart';
import 'package:app/view/components/donation_detail/donation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MakeDonationButton extends StatelessWidget {
  const MakeDonationButton({
    Key? key,
    required this.target,
    required this.donationController,
  }) : super(key: key);

  final Target target;
  final DonationController donationController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        dynamic result = await Get.defaultDialog(
          title: "기부 참가하기",
          content: const DonationDialog(),
        );
        if (result["done"]) {
          final creationDTO = (result["dto"] as DonationCreationDTO);
          creationDTO.targetId = target.id!;
          donationController.save(creationDTO);
        }
      },
      child: Text('${target.name}에 기부하기'),
    );
  }
}
