import 'package:app/controller/dto/feedback_creation_dto.dart';
import 'package:app/controller/feedback_controller.dart';
import 'package:app/domain/target/target.dart';
import 'package:app/view/components/finished_detail/feedback_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MakeFeedbackButton extends StatelessWidget {
  MakeFeedbackButton({
    Key? key,
    required this.target,
  }) : super(key: key);

  final Target target;
  final FeedbackController feedbackController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        dynamic result = await Get.defaultDialog(
          title: "감사 인사하기",
          content: const FeedbackDialog(),
        );
        if (result["done"]) {
          final creationDTO = (result["dto"] as FeedbackCreationDTO);
          creationDTO.targetId = target.id!;
          feedbackController.save(creationDTO);
        }
      },
      child: const Text('감사 인사하기'),
    );
  }
}
