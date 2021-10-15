import 'package:app/view/components/common/drawing.dart';
import 'package:app/controller/donation_controller.dart';
import 'package:app/domain/target/target.dart';
import 'package:app/util/get_server_url.dart';
import 'package:app/util/responsive_size.dart';
import 'package:app/view/components/common/donation_data_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

class FinishedDetailPage extends StatefulWidget {
  FinishedDetailPage({Key? key}) : super(key: key) {
    donationController.findByTargetId(target.id!);
  }

  final target = Get.arguments as Target;
  final donationController = Get.put(DonationController());

  @override
  State<FinishedDetailPage> createState() => _FinishedDetailPageState();
}

class _FinishedDetailPageState extends State<FinishedDetailPage> {
  bool expanded = false;
  ui.Image? image;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Future<void> loadImage() async {
    final url = Uri.parse(getPublicUrl(widget.target.imageUrl!));
    http.Response response = await http.get(url);
    final image = await decodeImageFromList(response.bodyBytes);
    setState(() => this.image = image);
  }

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
                height: screenHeight(context) * 0.2,
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: image == null
                      ? const CircularProgressIndicator()
                      : CustomPaint(
                          painter: ImagePainter(image!),
                          foregroundPainter: const OverlayBoxPainter(
                              0.1, 0.1, 0.5, 0.7, 0xaaff7f00),
                        ),
                ),
              ),

              // Scrollable section
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ExpansionPanelList(
                      animationDuration: const Duration(milliseconds: 500),
                      expandedHeaderPadding: const EdgeInsets.all(10),
                      // elevation: 4,
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          expanded = !isExpanded;
                        });
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder: (BuildContext context, bool isOpened) {
                            return Text(
                              '기본 정보',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth(context) * (16 / 360),
                                  color: Colors.black),
                            );
                          },
                          body: DonationLists(
                            donationController: widget.donationController,
                          ),
                          isExpanded: expanded,
                          canTapOnHeader: true,
                        )
                      ]),
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

class DonationLists extends StatelessWidget {
  const DonationLists({
    Key? key,
    required this.donationController,
  }) : super(key: key);

  final DonationController donationController;
  final isFinished = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              ],
              rows: donationController.donations
                  .map((d) => createDonationDataRow(d, isFinished))
                  .toList(),
            )),
      ),
    );
  }
}
