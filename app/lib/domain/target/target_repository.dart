import 'package:app/domain/target/target_provider.dart';
import 'package:app/util/convert_utf8.dart';
import 'package:get/get_connect.dart';

import 'target.dart';

class TargetRepository {
  final TargetProvider _targetProvider = TargetProvider();

  Future<List<Target>> getAllTargets(bool isFinished) async {
    Response response = await _targetProvider.getAllTargets(isFinished);
    List<dynamic> list = convertUtf8ToObject(response.body);
    var returned = list.map((t) => Target.fromJson(t)).toList();
    return returned;
  }
}
