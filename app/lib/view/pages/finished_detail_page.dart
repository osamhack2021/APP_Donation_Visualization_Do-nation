import 'package:app/controller/feedback_controller.dart';
import 'package:app/domain/donation/donation.dart';
import 'package:app/view/components/common/drawing.dart';
import 'package:app/controller/donation_controller.dart';
import 'package:app/domain/target/target.dart';
import 'package:app/util/get_server_url.dart';
import 'package:app/util/responsive_size.dart';
import 'package:app/view/components/common/donation_data_row.dart';
import 'package:app/view/components/common/feedback_data_row.dart';
import 'package:app/view/components/finished_detail/make_feedback_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

class FinishedDetailPage extends StatefulWidget {
  final target = Get.arguments as Target;

  @override
  State<FinishedDetailPage> createState() => _FinishedDetailPageState();
}

class _FinishedDetailPageState extends State<FinishedDetailPage> {
  List<bool> expanded = [false, false];
  ui.Image? image;
  Donation selectedDonation = Donation();

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

  void changeDonation(Donation pressedDonation) {
    setState(() {
      if (pressedDonation.id == selectedDonation.id) {
        selectedDonation = Donation();
      } else {
        selectedDonation = pressedDonation;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.target.name!,
          style: Theme.of(context).textTheme.headline1,
        ),
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
                          foregroundPainter: OverlayBoxPainter(
                            selectedDonation.p1,
                            selectedDonation.p2,
                            0xaaff7f00,
                          ),
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
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          expanded.asMap().forEach((i, value) {
                            if (i == index) {
                              expanded[i] = !isExpanded;
                            } else {
                              expanded[i] = false;
                            }
                          });
                        });
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder: (BuildContext context, bool isOpened) {
                            return Text('기부 정보',
                                style: Theme.of(context).textTheme.headline2);
                          },
                          body: DonationLists(
                            targetId: widget.target.id!,
                            onPressed: changeDonation,
                          ),
                          isExpanded: expanded[0],
                          canTapOnHeader: true,
                        ),
                        ExpansionPanel(
                          headerBuilder: (BuildContext context, bool isOpened) {
                            return Text('피드백',
                                style: Theme.of(context).textTheme.headline2);
                          },
                          body: FeedbackLists(
                            targetId: widget.target.id!,
                          ),
                          isExpanded: expanded[1],
                          canTapOnHeader: true,
                        )
                      ]),
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
                        "여러분의 감사 인사를 남겨주세요!",
                        style: (Theme.of(context).textTheme.bodyText1!),
                      ),
                      MakeFeedbackButton(
                        target: widget.target,
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

class DonationLists extends StatelessWidget {
  DonationLists({
    Key? key,
    required this.targetId,
    required this.onPressed,
  }) : super(key: key) {
    donationCont.findByTargetId(targetId);
  }

  final DonationController donationCont = Get.put(DonationController());
  final isFinished = true;
  final int targetId;
  final void Function(Donation) onPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * 0.9,
        ),
        child: Obx(() => DataTable(
              showCheckboxColumn: false,
              columnSpacing: 10.0,
              columns: [
                DataColumn(
                  label:
                      Text("기부자", style: Theme.of(context).textTheme.bodyText1),
                ),
                DataColumn(
                  label: Text("기부 메시지",
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                DataColumn(
                  label:
                      Text("기부금", style: Theme.of(context).textTheme.bodyText1),
                  numeric: true,
                ),
              ],
              rows: donationCont.donations
                  .map((d) =>
                      createDonationDataRow(d, isFinished, onPressed, context))
                  .toList(),
            )),
      ),
    );
  }
}

class FeedbackLists extends StatelessWidget {
  FeedbackLists({
    Key? key,
    required this.targetId,
  }) : super(key: key) {
    feedbackCont.findByTargetId(targetId);
  }

  final FeedbackController feedbackCont = Get.put(FeedbackController());
  final int targetId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * 0.9,
        ),
        child: Obx(() => DataTable(
              showCheckboxColumn: false,
              columnSpacing: 10.0,
              columns: [
                DataColumn(
                  label:
                      Text("사용자", style: Theme.of(context).textTheme.bodyText1),
                ),
                DataColumn(
                  label:
                      Text("피드백", style: Theme.of(context).textTheme.bodyText1),
                ),
                const DataColumn(
                  label: Text(""),
                ),
              ],
              rows: feedbackCont.feedbacks
                  .map((f) => createFeedbackDataRow(f, targetId, context))
                  .toList(),
            )),
      ),
    );
  }
}
