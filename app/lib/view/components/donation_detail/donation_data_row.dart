import 'package:app/domain/donation/donation.dart';
import 'package:flutter/material.dart';

DataRow createDonationDataRow(Donation donation) {
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
        Text(donation.payWon!.toString()),
      ),
    ],
  );
}
