import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseQuestionsController extends GetxController {
  final GlobalKey<ScaffoldState> courseQuestionsKey = GlobalKey<ScaffoldState>();


  RxBool isFavQuesCheck = false.obs;
  RxBool isCorrectQuesCheck = false.obs;


  RxBool selectAnswer = false.obs;
  RxInt answer = 0.obs;
  RxBool isFav = false.obs;

  void changeFav(bool val)

  {
    isFav.value = !val;
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
