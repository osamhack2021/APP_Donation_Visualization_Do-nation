import 'package:app/controller/donation_controller.dart';
import 'package:app/domain/target/target.dart';
import 'package:app/util/formatters.dart';
import 'package:app/view/components/donation_detail/donation_data_row.dart';
import 'package:app/view/components/donation_detail/make_donation_button.dart';
import 'package:app/view/components/donation_detail/target_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class DonationDetailPage extends StatelessWidget {
  DonationDetailPage({Key? key}) : super(key: key) {
    donationController.findByTargetId(target.id!);
  }

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
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width * 0.9,
                      ),
                      child: Obx(() => DataTable(
                            columnSpacing: 10.0,
                            columns: const [
                              DataColumn(label: Text("기부자")),
                              DataColumn(label: Text("기부 메시지")),
                              DataColumn(label: Text("기부금"), numeric: true),
                              DataColumn(label: Text("")),
                            ],
                            rows: donationController.donations
                                .map((d) => createDonationDataRow(d))
                                .toList(),
                          )),
                    ),
                  ),
                ),
              ),

              // Bottom section
              Container(
                color: Colors.lightGreen,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${formatCurrency(target.objectiveWon!)}원 중 ${formatCurrency(target.currentWon!)}원 모금완료! (${(target.currentWon! / target.objectiveWon! * 100).toStringAsFixed(1)}%)",
                        style: const TextStyle(fontSize: 13.0),
                      ),
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
