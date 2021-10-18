import 'package:app/domain/target/target.dart';
import 'package:app/util/get_server_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(getPublicUrl(target.imageUrl!)),
              ),
            ),
            Expanded(
              flex: 3,
              child: _TargetDescription(target: target),
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
    required this.target,
  }) : super(key: key);

  final Target target;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            target.name!,
            style: Theme.of(context).textTheme.headline2,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
          Text(
            target.desc!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          SfLinearGauge(
            minimum: 0,
            maximum: target.objectiveWon!.toDouble(),
            showTicks: false,
            showLabels: false,
            barPointers: [
              LinearBarPointer(value: target.currentWon!.toDouble())
            ],
            markerPointers: target.goals
                .map(
                  (g) => LinearWidgetPointer(
                    value: g.objectiveWon!.toDouble(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          CupertinoIcons.arrowtriangle_up_fill,
                          size: 10.0,
                        ),
                        Text(
                          g.goal!,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                    position: LinearElementPosition.inside,
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
