import 'package:app/controller/dto/donation_delete_dto.dart';
import 'package:app/util/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:get/get.dart';

class DonationDeleteDialog extends StatefulWidget {
  final int targetId;

  const DonationDeleteDialog({Key? key, required this.targetId})
      : super(key: key);

  @override
  State<DonationDeleteDialog> createState() => _DonationDeleteDialogState();
}

class _DonationDeleteDialogState extends State<DonationDeleteDialog> {
  final _formKey = GlobalKey<FormState>();
  String donorName = "";
  String phone = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.name,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '기부자 이름',
              contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            onSaved: (String? value) {
              donorName = value ?? donorName;
            },
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            keyboardType: TextInputType.phone,
            autofocus: false,
            inputFormatters: [
              LibPhonenumberTextFormatter(
                country: krPhoneCode,
                inputContainsCountryCode: true,
                additionalDigits: 3,
              ),
            ],
            decoration: InputDecoration(
              hintText: krPhoneCode.exampleNumberMobileInternational,
              contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            onSaved: (String? value) {
              phone = value ?? phone;
            },
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: '비밀번호',
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
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
                  final dto = makeDeleteDTO();
                  Get.back(result: {
                    "done": true,
                    "dto": dto,
                  });
                },
                child:
                    const Text('삭제하기', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 5.0),
              OutlinedButton(
                onPressed: () {
                  Get.back(result: {
                    "done": false,
                  });
                },
                child:
                    const Text('취소하기', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  DonationDeleteDTO makeDeleteDTO() {
    _formKey.currentState!.save();
    return DonationDeleteDTO(
      donorName: donorName,
      phone: phone,
      password: password,
      targetId: widget.targetId,
    );
  }
}
