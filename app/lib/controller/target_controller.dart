import 'package:app/domain/target/target.dart';
import 'package:app/domain/target/target_repository.dart';
import 'package:get/state_manager.dart';

class TargetController extends GetxController {
  final targets = <Target>[].obs;
  @override
  void onInit() {
    fetchTarget();
    super.onInit();
  }

  void fetchTarget() async {
    // ignore: unused_local_variable
    List<Target> targetList = await TargetRepository().getAllTargets();
    targets.value = targetList;
    //ProductServices is a Separate class from where I am fetching the API
  }
}
