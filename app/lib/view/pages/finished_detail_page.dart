import 'dart:async';

import 'package:app/controller/donation_controller.dart';
import 'package:app/domain/target/target.dart';
import 'package:app/util/get_server_url.dart';
import 'package:app/util/responsive_size.dart';
import 'package:app/view/components/common/donation_data_row.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/painting/image_decoder.dart';
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

class ImagePainter extends CustomPainter {
  final ui.Image image;

  const ImagePainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final outerBox = Rect.fromLTWH(0, 0, size.width, size.height);
    var outerBoxPaint = Paint()
      ..color = Color(0xff995588)
      ..style = PaintingStyle.fill;
    canvas.drawRect(outerBox, outerBoxPaint);
    paintImage(image, outerBox, canvas, paint, BoxFit.scaleDown);

    final overlapBox = Offset(size.width * 0.2, size.height * 0.5) &
        Size(size.width * 0.1, size.height * 0.5);
    var overlapBoxPaint = Paint()
      ..color = Color(0xaaffffff)
      ..style = PaintingStyle.fill;
    canvas.drawRect(overlapBox, overlapBoxPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  void paintImage(
      ui.Image image, Rect outputRect, Canvas canvas, Paint paint, BoxFit fit) {
    final Size imageSize =
        Size(image.width.toDouble(), image.height.toDouble());
    final FittedSizes sizes = applyBoxFit(fit, imageSize, outputRect.size);
    final Rect inputSubrect =
        Alignment.center.inscribe(sizes.source, Offset.zero & imageSize);
    final Rect outputSubrect =
        Alignment.center.inscribe(sizes.destination, outputRect);
    canvas.drawImageRect(image, inputSubrect, outputSubrect, paint);
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
