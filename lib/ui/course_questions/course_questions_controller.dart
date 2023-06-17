import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseQuestionsController extends GetxController {
  final GlobalKey<ScaffoldState> courseQuestionsKey = GlobalKey<ScaffoldState>();

  RxBool isFavQuesCheck = false.obs;
  RxBool isCorrectQuesCheck = false.obs;

  RxBool selectAnswer = false.obs;
  RxInt answer = 0.obs;
  RxBool isFav = false.obs;

  Timer? timer;
  int reminderTime = 600;
  final time = "00.00".obs;
  void changeFav(bool val)
  {
    isFav.value = !val;
  }

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
    if(timer != null)
    {
      timer!.cancel();
    }
    super.dispose();
  }


}
