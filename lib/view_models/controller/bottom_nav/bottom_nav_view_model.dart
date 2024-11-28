import 'dart:ui';

import 'package:get/get.dart';
import 'package:tentwenty/res/colors/app_color.dart';

class BottomNavigationController extends GetxController {
  var index = 1.obs;
  var isDetailScreen = false.obs;

  void changeTabIndex(t) {
    index.value = t;
    if (index.value != 0) {
      playing.value = false;
    }
    if (index.value == 0) {
      playing.value = true;
    }
    update();
  }

  var playing = true.obs;
  Color get backgroundColor => AppColor.n11Color;
}
