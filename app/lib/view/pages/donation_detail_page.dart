import 'package:app/controller/donation_controller.dart';
import 'package:app/controller/dto/donation_creation_dto.dart';
import 'package:app/domain/target/target.dart';
import 'package:app/view/components/donation_detail/donation_dialog.dart';
import 'package:app/view/components/donation_detail/make_donation_button.dart';
import 'package:app/view/components/donation_detail/target_info.dart';
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
              // Top section
              Container(
                color: Colors.teal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TargetInfo(
                    target: target,
                  ),
                ),
              ),

              // Scrollable section
              Expanded(
                child: Center(
                  child: ListView(
                    children: [], //your list view content here
                  ),
                ),
              ),

              // Bottom section
              Container(
                color: Colors.lightGreen,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MakeDonationButton(
                        target: target,
                        donationController: donationController,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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