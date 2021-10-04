import 'package:app/components/donation_list/target_card.dart';
import 'package:app/models/target.dart';
import 'package:flutter/material.dart';

class DonationListPage extends StatelessWidget {
  const DonationListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('국군 장병 기부 장려 프로그램.'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => SizedBox(
          height: 150,
          child: InkWell(
            onTap: () {
              print("target clicked");
            },
            child: TargetCard(target: example),
          ),
        ),
      ),
    );
  }
}
