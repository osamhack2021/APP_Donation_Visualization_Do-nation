import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('국군 장병 기부 장려 프로그램'),
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
                  child: const Text('장병들에게 기부하기!'),
                  onPressed: () {
                    //   Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Myapp())
                    // );
                  },
                ),
              ),
              SizedBox(
                height: 48,
                width: double.maxFinite,
                child: ElevatedButton(
                  child: const Text('기부 완료 목록 확인하기'),
                  onPressed: () {},
                ),
              )
            ]));
  }
}
