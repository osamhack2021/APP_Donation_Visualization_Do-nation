import 'package:app/domain/target/target_provider.dart';
import 'package:app/util/convert_utf8.dart';
import 'package:get/get_connect.dart';

import 'target.dart';

class TargetRepository {
  final TargetProvider _targetProvider = TargetProvider();

  Future<List<Target>> getAllTargets() async {
    Response response = await _targetProvider.getAllTargets();
    List<Map<String, dynamic>> list = convertUtf8ToObjec(response.body);
    return list.map((t) => Target.fromJson(t)).toList();
  }
}
