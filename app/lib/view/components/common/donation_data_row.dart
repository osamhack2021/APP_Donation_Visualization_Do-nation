import 'package:app/controller/donation_controller.dart';
import 'package:app/controller/dto/donation_delete_dto.dart';
import 'package:app/domain/donation/donation.dart';
import 'package:app/util/formatters.dart';
import 'package:app/view/components/donation_detail/donation_delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

DataRow createDonationDataRow(Donation donation, bool isFinished) {
  final donationController = Get.put(DonationController());

  return DataRow(
    cells: [
      DataCell(
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 80), //SET max width
          child: Text(donation.donorName!, overflow: TextOverflow.ellipsis),
        ),
      ),
      DataCell(
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 150), //SET max width
          child: Text(donation.message!, overflow: TextOverflow.ellipsis),
        ),
      ),
      DataCell(
        Text(formatCurrency(donation.payWon!, symbol: '\u{20A9}')),
      ),
      if (!isFinished) ...[
        DataCell(IconButton(
          icon: const Icon(Icons.delete),
          color: Colors.deepOrange,
          onPressed: () async {
            dynamic result = await Get.defaultDialog(
              title: "기부 취소",
              content: DonationDeleteDialog(targetId: donation.targetId!),
            );
            if (result["done"]) {
              final deleteDTO = (result["dto"] as DonationDeleteDTO);
              donationController.deleteDonation(donation.id!, deleteDTO);
            }
          },
        )),
      ]
    ],
  );
}
