import 'package:mobx/mobx.dart';

part 'saved_controller.g.dart';

class SavedController = _SavedControllerBase with _$SavedController;

abstract class _SavedControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
