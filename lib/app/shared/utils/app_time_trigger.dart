import 'dart:async';

import 'package:get/get_state_manager/get_state_manager.dart';

class AppTimerTrigger extends GetxController {
  Timer timer;

  setTimer({int milliseconds, Function callBack}) {
    if (timer?.isActive ?? false) {
      timer.cancel();
    }
    timer = Timer(Duration(milliseconds: milliseconds), callBack);
  }

  cancel() {
    if (timer?.isActive ?? false) {
      timer.cancel();
    }
  }
}
