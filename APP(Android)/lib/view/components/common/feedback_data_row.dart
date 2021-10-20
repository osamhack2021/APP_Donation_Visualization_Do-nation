import 'package:app/controller/dto/feedback_delete_dto.dart';
import 'package:app/controller/feedback_controller.dart';
import 'package:app/view/components/finished_detail/feedback_delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/domain/feedback/feedback.dart' as fb;

DataRow createFeedbackDataRow(
  fb.Feedback feedback,
  int targetId,
  BuildContext context,
) {
  final feedbackController = Get.put(FeedbackController());

  return DataRow(
    cells: [
      DataCell(
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 80), //SET max width
          child: Text(
            feedback.name!,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
      DataCell(
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 150), //SET max width
          child: Text(
            feedback.message!,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
      DataCell(
        IconButton(
          icon: const Icon(Icons.delete),
          color: Colors.deepOrange,
          onPressed: () async {
            dynamic result = await Get.defaultDialog(
              title: "피드백 삭제",
              content: FeedbackDeleteDialog(feedbackId: feedback.id!),
            );
            if (result["done"]) {
              final deleteDTO = (result["dto"] as FeedbackDeleteDTO);
              feedbackController.deleteFeedback(deleteDTO, targetId);
            }
          },
        ),
      ),
    ],
  );
}
