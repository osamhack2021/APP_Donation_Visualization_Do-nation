import 'package:app/domain/target/target.dart';
import 'package:app/util/get_server_url.dart';
import 'package:flutter/material.dart';

class FinishedCard extends StatelessWidget {
  const FinishedCard({
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
              child: Image.network(getPublicUrl(target.imageUrl!)),
            ),
            Expanded(
              flex: 3,
              child: _FinishedDescription(
                name: target.name!,
                desc: target.desc!,
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

class _FinishedDescription extends StatelessWidget {
  const _FinishedDescription({
    Key? key,
    required this.name,
    required this.desc,
  }) : super(key: key);

  final String name;
  final String desc;

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
            style: Theme.of(context).textTheme.headline2,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
          Text(
            desc,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
