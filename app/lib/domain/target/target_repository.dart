import 'package:app/domain/target/target_provider.dart';
import 'package:get/get_connect.dart';

class TargetRepository {
  final TargetProvider _targetProvider = TargetProvider();

  Future<void> getAllTargets() async {
    Response response = await _targetProvider.getAllTargets();
    print(response.headers);
    print(response.body);
  }
}
