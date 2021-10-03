import 'package:flutter/material.dart';

class DonationListPage extends StatelessWidget {
  const DonationListPage({
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('국군 장병 기부 장려 프로그램'),
          leading:
              IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 125,
                height: 150,
                color: Colors.grey,
                child: Image.asset(
                  '/workspaces/APP_Donation_Visualization_Do-nation/assets/bench.png',
                  width: 125,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 250,
                    height: 50,
                    color: Colors.grey[50],
                    child: const Text("53사단 통신대대에서 연병장에 놓을 벤치를 설치하기 위해 모금중입니다!",
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    width: 250,
                    height: 50,
                    color: Colors.grey[50],
                    child: const LinearProgressIndicator(
                      value: 0.4622,
                      backgroundColor: Colors.grey,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}