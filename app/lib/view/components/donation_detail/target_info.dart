import 'package:app/domain/target/target.dart';
import 'package:app/util/get_server_url.dart';
import 'package:flutter/material.dart';

class TargetInfo extends StatelessWidget {
  const TargetInfo({
    Key? key,
    required this.target,
  }) : super(key: key);

  final Target target;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Image.network(getPublicUrl(target.imageUrl!)),
        ),
        Expanded(
          flex: 3,
          child: _TargetDescription(
            name: target.name!,
            desc: target.desc!,
            objectiveWon: target.objectiveWon!,
            currentWon: target.currentWon!,
          ),
        ),
      ],
    );
  }
}

class _TargetDescription extends StatelessWidget {
  const _TargetDescription(
      {Key? key,
      required this.name,
      required this.desc,
      required this.objectiveWon,
      required this.currentWon})
      : super(key: key);

  final String name;
  final String desc;
  final int objectiveWon;
  final int currentWon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
          Text(
            desc,
            style: const TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
