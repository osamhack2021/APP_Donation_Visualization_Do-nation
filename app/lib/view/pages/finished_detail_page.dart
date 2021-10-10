import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinishedDetailPage extends StatelessWidget {
  const FinishedDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finished Detail'),
      ),
      body: Text("${Get.arguments["id"]}"),
    );
  }
}
