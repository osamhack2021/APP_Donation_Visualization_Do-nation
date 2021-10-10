import 'package:app/controller/target_controller.dart';
import 'package:app/view/components/finished_list/finished_card.dart';
import 'package:app/view/pages/finished_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinishedListPage extends StatelessWidget {
  final TargetController targetController = Get.put(TargetController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('국군 장병 기부 장려 프로그램.'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: ListView.builder(
            itemCount: targetController.targets.length,
            itemBuilder: (context, index) => SizedBox(
              height: 150,
              child: InkWell(
                onTap: () {
                  Get.to(() => FinishedDetailPage(),
                      arguments: {"id": targetController.targets[index].id});
                },
                child: FinishedCard(target: targetController.targets[index]),
              ),
            ),
          ),
        ));
  }
}
