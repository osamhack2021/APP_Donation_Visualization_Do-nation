import 'package:app/controller/dto/feedback_delete_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackDeleteDialog extends StatefulWidget {
  final int feedbackId;

  const FeedbackDeleteDialog({Key? key, required this.feedbackId})
      : super(key: key);

  @override
  State<FeedbackDeleteDialog> createState() => _FeedbackDeleteDialogState();
}

class _FeedbackDeleteDialogState extends State<FeedbackDeleteDialog> {
  final _formKey = GlobalKey<FormState>();
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
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
                child: const Text(
                  '삭제하기',
                  style: TextStyle(color: Colors.white),
                ),
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

  FeedbackDeleteDTO makeDeleteDTO() {
    _formKey.currentState!.save();
    return FeedbackDeleteDTO(
      id: widget.feedbackId,
      password: password,
    );
  }
}
