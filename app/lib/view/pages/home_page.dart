import 'package:app/view/pages/donation_list_page.dart';
import 'package:app/view/pages/finished_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '국군 장병 기부 장려 프로그램',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset(
                'assets/img.jpeg',
                width: 600,
                height: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 48,
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Text(
                    '장병들에게 기부하기!',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  onPressed: () {
                    Get.to(() => DonationListPage());
                  },
                ),
              ),
              SizedBox(
                height: 48,
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Text('기부 완료 목록 확인하기',
                      style: Theme.of(context).textTheme.headline2),
                  onPressed: () {
                    Get.to(() => FinishedListPage());
                  },
                ),
              )
            ]));
  }
}
