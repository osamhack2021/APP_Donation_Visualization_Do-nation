import 'package:app/controller/donation_controller.dart';
import 'package:app/domain/target/target.dart';
import 'package:app/util/get_server_url.dart';
import 'package:app/view/components/donation_detail/donation_data_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinishedDetailPage extends StatelessWidget {
  FinishedDetailPage({Key? key}) : super(key: key) {
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
                alignment: Alignment.center,
                color: Colors.grey,
                height: 130,
                width: double.infinity,
                child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      getPublicUrl(target.imageUrl!),
                      fit: BoxFit.cover,
                    )),
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
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
