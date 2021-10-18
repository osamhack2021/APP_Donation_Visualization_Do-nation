import 'package:app/controller/target_controller.dart';
import 'package:app/view/components/finished_list/finished_card.dart';
import 'package:app/view/pages/finished_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinishedListPage extends StatelessWidget {
  final TargetController targetController = Get.put(TargetController());

  FinishedListPage({Key? key}) : super(key: key) {
    targetController.fetchTarget(isFinished: true);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(
              '모금 완료 상품',
              style: Theme.of(context).textTheme.headline1,
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SafeArea(
            child: ListView.builder(
              itemCount: targetController.targets.length,
              itemBuilder: (context, index) => SizedBox(
                height: 150,
                child: InkWell(
                  onTap: () {
                    Get.to(() => FinishedDetailPage(),
                        arguments: targetController.targets[index]);
                  },
                  child: FinishedCard(target: targetController.targets[index]),
                ),
              ),
            ),
          ),
        ));
  }
}
