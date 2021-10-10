import 'package:app/domain/target/target.dart';
import 'package:app/view/components/donation_detail/donation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationDetailPage extends StatelessWidget {
  DonationDetailPage({Key? key}) : super(key: key);
  final target = Get.arguments as Target;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation Detail'),
      ),
      body: ElevatedButton(
        onPressed: () async {
          bool result = await Get.defaultDialog(
            title: "기부 참가하기",
            content: const DonationDialog(),
          );
          print(result);
        },
        child: Text('${target.name}에게 기부하기'),
      ),
    );
  }
}
