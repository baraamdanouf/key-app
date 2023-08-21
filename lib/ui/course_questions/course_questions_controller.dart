import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/models/exam_model.dart';
import 'package:key_app/services/remote_services.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/utils/const_images.dart';
import 'package:key_app/utils/shared_preferance/shared_preferance.dart';
import 'package:key_app/widget/custom_text.dart';

class CourseQuestionsController extends GetxController {
  final GlobalKey<ScaffoldState> courseQuestionsKey = GlobalKey<ScaffoldState>();

  String courseId = SaveDateInSharedPreference.getCourseId();
  RxList<ExamModel> courseExam = RxList<ExamModel>([]);
  RxList<Map<String, dynamic>> colorsOptions = <Map<String, dynamic>>[].obs;
  RxList<RxInt> radioBtnValues = RxList<RxInt>([]);
  RxList<Map<String, dynamic>>? iconsAns = <Map<String, dynamic>>[].obs;

  RxBool isLoading = true.obs;
  RxBool isVisibleIcons = false.obs;

  List<int> shimmer = [1,2,3,4,5,6,7,8];
  List<int> shimmerQues = [1,2,3,4];

  RxBool isFavQuesCheck = false.obs;
  RxBool isCorrectQuesCheck = false.obs;

  RxBool selectAnswer = false.obs;
  RxInt answer = 0.obs;
  RxBool isFav = false.obs;

  final RxInt _totalSeconds = 600.obs; // Total seconds for the countdown timer
  final RxInt _seconds = 0.obs; // Reactive variable to store seconds
  final RxInt _minutes = 0.obs; // Reactive variable to store minutes
  Timer? _timer; // Timer object
  RxInt get seconds => _seconds;
  RxInt get minutes => _minutes;

  final correctCounter = 0.obs;
  final notCorrectCounter = 0.obs;
  final total = 0.obs;
  RxBool playConfetti = false.obs;
  final time = "00.00".obs;

  RxList<Rx<Color>> colorsAll = RxList<Rx<Color>>([]);

  void changeCorrectCounter()
  {
    correctCounter.value++;
  }
  void changeNotCorrectCounter()
  {
    notCorrectCounter.value++;
  }
  void changeFav(bool val)
  {
    isFav.value = !val;
  }


  void checkAns(int index, RxInt? val, bool isAll)
  {
    isVisibleIcons.value = true;
     isAll? null : colorsOptions[index]['${courseExam[index].correctAnswer!+1}'] = primaryColor.obs;
    isAll? null :  iconsAns?[index]['${courseExam[index].correctAnswer!+1}'] = true.obs;
      switch (val?.value) {
       case 1:
         if(courseExam[index].correctAnswer! + 1 == val?.value) {
            colorsOptions[index]['${val?.value}'].value = primaryColor;
            iconsAns?[index]['${val?.value}'] = true.obs;
         }
         else
         {colorsOptions[index]['${val?.value}'].value = Colors.red;
          iconsAns?[index]['${val?.value}'] = false.obs;
         }
         break;
       case 2:
         if(courseExam[index].correctAnswer! + 1 == val?.value) {
          iconsAns?[index]['${val?.value}'] = true.obs;
           colorsOptions[index]['${val?.value}'].value= primaryColor;}
         else
         {colorsOptions[index]['${val?.value}'].value = Colors.red;
         iconsAns?[index]['${val?.value}'] = false.obs;
         }
         break;
       case 3:
         if(courseExam[index].correctAnswer! + 1 == val?.value) {
           iconsAns?[index]['${val?.value}'] = true.obs;
           colorsOptions[index]['${val?.value}'].value = primaryColor;}
         else
         {colorsOptions[index]['${val?.value}'].value = Colors.red;
         iconsAns?[index]['${val?.value}'] = false.obs;
         }
         break;
       case 4:
         if(courseExam[index].correctAnswer! + 1 == val?.value) {
          iconsAns?[index]['${val?.value}'] = true.obs;
           colorsOptions[index]['${val?.value}'].value = primaryColor;}
         else
         {
           iconsAns![index]['${val?.value}'] = false.obs;
           colorsOptions[index]['${val?.value}'].value = Colors.red;}
         break; default:
     }
     if(courseExam[index].correctAnswer! + 1 == val?.value)
     {
       changeCorrectCounter();
     }
     else if(courseExam[index].correctAnswer! + 1 != val?.value)
     {
       changeNotCorrectCounter();
     }
  }

  void checkAnsOne(int index, RxInt? val)
  {
    if(courseExam[index].correctAnswer! + 1 == val?.value)
    {
      changeCorrectCounter();
    }
    // else if(courseExam[index].correctAnswer! + 1 != val?.value)
    // {
    //   changeNotCorrectCounter();
    // }
  }
  RxInt val = 0.obs;
  final isFabOpen = false.obs;

  void toggleFab() {
    isFabOpen.value = !isFabOpen.value;
  }

  void onPressedFab(int index) {

    switch (index) {
      case 0:
        for(int i = 0; i< courseExam.length; i++)
        {
          colorsOptions[i]['1'] = SaveDateInSharedPreference.getTheming()? Colors.white.obs: Colors.black.obs;
          colorsOptions[i]['2'] = SaveDateInSharedPreference.getTheming()? Colors.white.obs: Colors.black.obs;
          colorsOptions[i]['3'] = SaveDateInSharedPreference.getTheming()? Colors.white.obs: Colors.black.obs;
          colorsOptions[i]['4'] = SaveDateInSharedPreference.getTheming()? Colors.white.obs: Colors.black.obs;
          radioBtnValues[i] = 0.obs;
          iconsAns![i]['1'] = null.obs;
          iconsAns![i]['2'] = null.obs;
          iconsAns![i]['3'] = null.obs;
          iconsAns![i]['4'] = null.obs;
          correctCounter.value = 0;
          notCorrectCounter.value = 0;
        }
        break;
      case 1:
        for(int i = 0; i< courseExam.length; i++)
          {
            checkAns(i, radioBtnValues[i], true);
          }
        break;
      case 2:
       for(int i = 0; i< courseExam.length; i++)
       {
         colorsOptions[i]['${courseExam[i].correctAnswer!+1}'] = primaryColor.obs;
         iconsAns?[i]['${courseExam[i].correctAnswer!+1}'] = true.obs;
       }
       break;
    }}

  void startCountdownTimer() {
    _timer ??= Timer.periodic(const Duration(seconds: 1), (_) {
        if (_totalSeconds.value > 0) {
          _totalSeconds.value--;
          _minutes.value = _totalSeconds.value ~/ 60;
          _seconds.value = _totalSeconds.value % 60;

        } else {
     //     total.value = ((correctCounter.value / courseExam.length)* 100).round();
          for(int i = 0; i< courseExam.length; i++)
          {
            checkAnsOne(i, radioBtnValues[i]);
          }
          Get.dialog(AlertDialog(
            backgroundColor: MainController.themeData.value.dividerColor,
            content: Container(
              height: 225.h,
              width: 340.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(celebrate),
                  Obx(()=> CustomText(
                      text: '% ${((correctCounter.value / courseExam.length)* 100).round()}',
                      textColor: Colors.black,
                      alignment: AlignmentDirectional.center,
                      textAlign: TextAlign.center,
                      fontSize: 18.h,
                      bold: true,
                    ),
                  ),
                  CustomText(
                    text: 'حصلت على ${correctCounter.value} نقاط من إجابتك على الأسئلة',
                    textColor: Colors.black54,
                    fontSize: 15.h,
                    alignment: AlignmentDirectional.center,
                    heightText: 2.h,
                    textAlign: TextAlign.center,
                    bold: true,
                  ),
                ],
              ),
            ),
          ));
          _timer?.cancel();
          _timer = null;
        }
      });
  }

  // Stop the countdown timer
  void stopCountdownTimer() {
    _timer?.cancel();
    _timer = null;
  }

  // Reset the countdown timer
  void resetCountdownTimer() {
    _totalSeconds.value = 120;
    _minutes.value = _totalSeconds.value ~/ 60;
    _seconds.value = _totalSeconds.value % 60;
    _timer?.cancel();
    _timer = null;
  }

  void handleRadioValueChanged(int value) {
      answer.value = value;
  }

  void addColors(Map<String, dynamic> newItem) {
    colorsOptions.add(newItem.obs);
  }

  void addIcons(Map<String, dynamic> newItem) {
    iconsAns?.add(newItem.obs);
  }
  Future<List<ExamModel>> fetchCourseExam() async {
    List<dynamic> data = await getCourseExam(courseId);
    courseExam.value = data.map((json) => ExamModel.fromJson(json)).toList();
    isLoading.value = false;
    for(var i = 0; i< courseExam.length ; i++)
      {
        addColors({'1': SaveDateInSharedPreference.getTheming()? Colors.white.obs: Colors.black.obs,
          '2':  SaveDateInSharedPreference.getTheming()? Colors.white.obs: Colors.black.obs,
          '3':  SaveDateInSharedPreference.getTheming()? Colors.white.obs: Colors.black.obs,
          '4':  SaveDateInSharedPreference.getTheming()? Colors.white.obs: Colors.black.obs});

        addIcons({'1': null.obs, '2': null.obs,
          '3': null.obs, '4': null.obs});

      }
    for(var i = 0; i< courseExam.length ; i++)
    {
      radioBtnValues.add(0.obs);
    }
    return courseExam;
  }

  @override
  void onInit() async{
    super.onInit();
    await fetchCourseExam();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
