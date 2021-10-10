import 'package:app/controller/dto/donation_creation_dto.dart';
import 'package:app/util/get_server_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationDialog extends StatefulWidget {
  const DonationDialog({Key? key}) : super(key: key);

  @override
  State<DonationDialog> createState() => _DonationDialogState();
}

class _DonationDialogState extends State<DonationDialog> {
  final _formKey = GlobalKey<FormState>();
  String donorName = "";
  String message = "";
  String phone = "";
  int payWon = 0;
  String password = "";

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width * 0.9,
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.name,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: '기부자 이름',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
                onSaved: (String? value) {
                  donorName = value ?? donorName;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: '남기고싶은 메세지',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
                onSaved: (String? value) {
                  message = value ?? message;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                keyboardType: TextInputType.phone,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: '전화번호',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
                onSaved: (String? value) {
                  phone = value ?? phone;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                keyboardType: TextInputType.number,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: '기부 금액',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
                onSaved: (String? value) {
                  if (value != null) {
                    payWon = int.parse(value);
                  }
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: '비밀번호',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
                onSaved: (String? value) {
                  password = value ?? password;
                },
              ),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      /*send to server*/
                      final dto = makeCreationDTO();
                      Get.back(result: {
                        "done": true,
                        "dto": dto,
                      });
                    },
                    child: const Text('등록하기',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 5.0),
                  OutlinedButton(
                    onPressed: () {
                      Get.back(result: {
                        "done": false,
                      });
                    },
                    child: const Text('취소하기',
                        style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  DonationCreationDTO makeCreationDTO() {
    _formKey.currentState!.save();
    return DonationCreationDTO(
      donorName: donorName,
      message: message,
      phone: phone,
      payWon: payWon,
      password: password,
    );
  }
}
