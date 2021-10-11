import 'package:app/controller/donation_controller.dart';
import 'package:app/controller/dto/donation_creation_dto.dart';
import 'package:app/domain/target/target.dart';
import 'package:app/view/components/donation_detail/donation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationDetailPage extends StatelessWidget {
  DonationDetailPage({Key? key}) : super(key: key);
  final target = Get.arguments as Target;
  final donationController = Get.put(DonationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation Detail'),
      ),
      body: Container(
        color: Colors.amber,
        child: SizedBox(
          height: double.infinity,
          child: Column(
            children: [
              Container(
                height: 100.0,
                color: Colors.teal,
              ), // some top content

              Expanded(
                child: Center(
                  child: ListView(
                    children: [], //your list view content here
                  ),
                ),
              ),

              Container(
                color: Colors.lightGreen,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _MakeDonationButton(
                          target: target,
                          donationController: donationController),
                    ],
                  ),
                ),
              ), // some bottom content
            ],
          ),
        ),
      ),
    );
  }
}

class _MakeDonationButton extends StatelessWidget {
  const _MakeDonationButton({
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
      child: Text('${target.name}에게 기부하기'),
    );
  }
}


/*Column(
          children: [
            Container(
              height: 10.0,
              color: Colors.teal,
            ), // some top content

            Container(
              color: Colors.amber,
              child: Expanded(
                child: Center(
                  child: ListView(
                    children: [], //your list view content here
                  ),
                ),
              ),
            ),

            Container(
              color: Colors.lightGreen,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _MakeDonationButton(
                        target: target, donationController: donationController),
                  ],
                ),
              ),
            ), // some bottom content
          ],
        )*/