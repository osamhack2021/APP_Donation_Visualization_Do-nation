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
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Image.asset(
              'assets/main_img.jpg',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '지금 이 순간에도 나라를 지키는\n국군 장병들을 위해 따듯한 도움을 주세요.',
                    style: Theme.of(context).textTheme.headline2,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
