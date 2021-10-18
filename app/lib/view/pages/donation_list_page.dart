import 'package:app/controller/target_controller.dart';
import 'package:app/view/components/donation_list/target_card.dart';
import 'package:app/view/pages/donation_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationListPage extends StatelessWidget {
  final TargetController targetController = Get.put(TargetController());

  DonationListPage({Key? key}) : super(key: key) {
    targetController.fetchTarget(isFinished: false);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(
              '모금 중인 상품',
              style: Theme.of(context).textTheme.headline1,
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: ListView.builder(
            itemCount: targetController.targets.length,
            itemBuilder: (context, index) => ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 140.0),
              child: InkWell(
                onTap: () {
                  Get.to(
                    () => DonationDetailPage(),
                    arguments: targetController.targets[index],
                  );
                },
                child: TargetCard(target: targetController.targets[index]),
              ),
            ),
          ),
        ));
  }
}
