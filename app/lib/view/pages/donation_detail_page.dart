import 'package:app/controller/donation_controller.dart';
import 'package:app/domain/donation/donation.dart';
import 'package:app/domain/target/target.dart';
import 'package:app/util/formatters.dart';
import 'package:app/view/components/common/donation_data_row.dart';
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
  final isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Donation Detail',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Container(
        color: Color(0xffffeed5).withOpacity(0.2),
        height: double.infinity,
        child: Column(
          children: [
            // Top section
            Container(
              color: Colors.blue[50],
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
                          headingRowColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            return Color(0xffabcae8);
                          }),
                          showCheckboxColumn: false,
                          columnSpacing: 10.0,
                          columns: [
                            DataColumn(
                                label: Text(
                              "기부자",
                              style: Theme.of(context).textTheme.bodyText1,
                            )),
                            DataColumn(
                                label: Text(
                              "기부 메시지",
                              style: Theme.of(context).textTheme.bodyText1,
                            )),
                            DataColumn(
                                label: Text(
                                  "기부금",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                numeric: true),
                            const DataColumn(label: Text("")),
                          ],
                          rows: donationController.donations
                              .map((d) => createDonationDataRow(
                                  d, isFinished, (Donation _) {}, context))
                              .toList(),
                        )),
                  ),
                ),
              ),
            ),

            // Bottom section
            Container(
              color: Color(0xffabcae8),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${formatCurrency(target.objectiveWon!)}원 중 ${formatCurrency(target.currentWon!)}원 모금완료! (${(target.currentWon! / target.objectiveWon! * 100).toStringAsFixed(1)}%)",
                      style: (Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12.0)),
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
    );
  }
}
