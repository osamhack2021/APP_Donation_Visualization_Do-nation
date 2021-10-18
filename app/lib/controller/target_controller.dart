import 'package:app/domain/target/target.dart';
import 'package:app/domain/target/target_repository.dart';
import 'package:get/state_manager.dart';

class TargetController extends GetxController {
  final targets = <Target>[].obs;

  void fetchTarget({required bool isFinished}) async {
    List<Target> targetList =
        await TargetRepository().getAllTargets(isFinished);
    targets.value = targetList;
  }
}
