import 'package:app/models/target.dart';
import 'package:flutter/material.dart';

class TargetCard extends StatelessWidget {
  const TargetCard({
    Key? key,
    required this.target,
  }) : super(key: key);

  final Target target;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54, width: 3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.asset(target.imageUrl),
            ),
            Expanded(
              flex: 3,
              child: _TargetDescription(
                name: target.name,
                desc: target.desc,
                progress: target.currentWon / target.objectiveWon,
              ),
            ),
            const Icon(
              Icons.more_vert,
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}

class _TargetDescription extends StatelessWidget {
  const _TargetDescription({
    Key? key,
    required this.name,
    required this.desc,
    required this.progress,
  }) : super(key: key);

  final String name;
  final String desc;
  final double progress;

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
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          LinearProgressIndicator(
            value: progress,
            semanticsLabel: "Donation Progress Indicator",
          ),
        ],
      ),
    );
  }
}
