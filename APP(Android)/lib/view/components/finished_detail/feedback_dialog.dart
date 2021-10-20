import 'package:app/controller/dto/feedback_creation_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({Key? key}) : super(key: key);

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String message = "";
  String password = "";
  String? imageUrl;

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
                  hintText: '사용자 이름',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
                onSaved: (String? value) {
                  name = value ?? name;
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

  FeedbackCreationDTO makeCreationDTO() {
    _formKey.currentState!.save();
    return FeedbackCreationDTO(
      name: name,
      message: message,
      password: password,
      imageUrl: imageUrl,
    );
  }
}
