import 'package:app/controller/donation_controller.dart';
import 'package:app/controller/dto/donation_creation_dto.dart';
import 'package:app/controller/target_controller.dart';
import 'package:app/domain/target/target.dart';
import 'package:app/view/components/donation_detail/donation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MakeDonationButton extends StatelessWidget {
  const MakeDonationButton({
    Key? key,
    required this.target,
  }) : super(key: key);

  final Target target;

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

          DonationController donationController = Get.find();
          await donationController.save(creationDTO);
          await donationController.findByTargetId(target.id!);

          TargetController targetController = Get.find();
          targetController.fetchTarget(isFinished: false);
        }
      },
      child: const Text('기부하기'),
    );
  }
}
