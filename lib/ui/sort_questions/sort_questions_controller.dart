import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SortQuestionsController extends GetxController {
  final GlobalKey<ScaffoldState> sortQuestionsKey = GlobalKey<ScaffoldState>();

    RxBool isCourseCheck = false.obs;
    RxBool isBankCheck = false.obs;
    RxBool isFavQuesCheck = false.obs;
    RxBool isCorrectQuesCheck = false.obs;
    RxBool isRepeatQuesCheck = false.obs;

    RxBool selectAnswer = false.obs;
    RxInt answer = 0.obs;
    RxBool isFav = false.obs;

    void changeFav(bool val)

    {
      isFav.value = !val;
    }

  Timer? timer;
  int reminderTime = 600;
  final time = "00.00".obs;

  final isFabOpen = false.obs;

  void toggleFab() {
    isFabOpen.value = !isFabOpen.value;
  }

  void onPressedFab(int index) {
    // Handle the button click based on the index
    switch (index) {
      case 0:
      // Handle button 1 click
        break;
      case 1:
      // Handle button 2 click
        break;
    // Add more cases for additional buttons
    }}

  startTimer()
  {
    const duration = Duration(seconds: 1);
    timer = Timer.periodic(duration, (Timer timer) {
      if(reminderTime > 0 || reminderTime == 0 )
      {
        int min = reminderTime~/60;
        int sec = reminderTime%60;
        time.value = "${min.toString().padLeft(2, "0")}:${sec.toString().padLeft(2, "0")}";
        reminderTime --;
        // update();
      }
      else if(reminderTime < 0)
      {
        timer.cancel();
        //   update();
      }
    });
  }
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
