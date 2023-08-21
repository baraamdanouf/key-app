import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/course_questions/course_questions_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/utils/shared_preferance/shared_preferance.dart';
import 'package:key_app/widget/custom-shimmer-widget.dart';
import 'package:key_app/widget/custom_text.dart';
import 'package:key_app/widget/drawer.dart';

class CourseQuestions extends GetView<CourseQuestionsController> {
  const CourseQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Get.put(CourseQuestionsController());
    return Obx(()=> Scaffold(
      key: controller.courseQuestionsKey,
      drawer: Drawer(child: drawer()),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        overlayOpacity: 0.4,
        animatedIconTheme: IconThemeData(color:MainController.themeData.value.dividerColor),
        backgroundColor: MainController.themeData.value.primaryColor,
        overlayColor: textColor,
        buttonSize: 65.h,
        children: [
          SpeedDialChild(
            child: Icon(Ionicons.reload_outline, color: MainController.themeData.value.dividerColor, size: 25.h,),
            labelWidget:Container(
              margin: const EdgeInsets.all(0),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: MainController.themeData.value.dividerColor,
              ),
              child: CustomText(text: 'تصفير الإجوبة', fontSize: 16.h, textColor: Colors.black,),
            ),
            backgroundColor: MainController.themeData.value.primaryColor,
            onTap: () => controller.onPressedFab(0),
          ),
          SpeedDialChild(
            child: Icon(Ionicons.checkbox_outline, color: MainController.themeData.value.dividerColor, size: 25.h,),
            labelWidget:Container(
              margin: const EdgeInsets.all(0),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: MainController.themeData.value.dividerColor,
              ),
              child: CustomText(text: 'تصحيح الإجوبة', fontSize: 16.h),
            ),
            backgroundColor: MainController.themeData.value.primaryColor,
            onTap: () => controller.onPressedFab(1),
          ),
          SpeedDialChild(
            child: Icon(Ionicons.create_outline, color: MainController.themeData.value.dividerColor, size: 25.h,),
            labelWidget:Container(
              margin: const EdgeInsets.all(0),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: MainController.themeData.value.dividerColor,
              ),
              child: CustomText(text: 'حل الأسئلة', fontSize: 16.h),
            ),
            backgroundColor: MainController.themeData.value.primaryColor,
            onTap: () => controller.onPressedFab(2),
          ),
          SpeedDialChild(
            child: Icon(Ionicons.stopwatch_outline, color: MainController.themeData.value.dividerColor, size: 25.h,),
            labelWidget:Container(
              margin: const EdgeInsets.all(0),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: MainController.themeData.value.dividerColor,
              ),
              child: CustomText(text: 'تشغيل المؤقت', fontSize: 16.h),
            ),
            backgroundColor: MainController.themeData.value.primaryColor,
            onTap: () => controller.startCountdownTimer(),
          ),
          // Add more SpeedDialChild widgets for additional buttons
        ],
    //    onOpen: controller.isFabOpen.value,
        onOpen: () => controller.toggleFab(),
        onClose: () => controller.toggleFab(),
      ),
          body: Obx(()=> SafeArea(
            child: SizedBox(
              width: width,
              child: Column(
                children: [
                Container(
                  width: width, height: 85.h,color: MainController.themeData.value.primaryColor,
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 18.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                      // Padding(
                      //   padding: EdgeInsetsDirectional.only(end: 18.w),
                      //   child: InkWell(
                      //       onTap: (){ controller.courseQuestionsKey.currentState!.openDrawer();},
                      //       child: Icon(Ionicons.menu_sharp, color: MainController.themeData.value.dividerColor, size: 35.h,)),
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              text: SaveDateInSharedPreference.getSubjectName(),
                              fontSize: 20.h,
                              bold: true,
                              alignment: AlignmentDirectional.center,
                              textColor: MainController.themeData.value.dividerColor),
                          CustomText(
                              text: Get.arguments['courseName'],
                              fontSize: 15.h,
                              marginTop: 8.h,
                              alignment: AlignmentDirectional.center,
                              textColor: MainController.themeData.value.dividerColor),
                        ],
                      ),
                    ],
                    ),
                      Icon(Ionicons.search_outline, color: MainController.themeData.value.dividerColor, size: 30.h,),
                    ],),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Obx(()=> CustomText(
                              text: '${controller.correctCounter.value}',
                              fontSize: 18.h,
                              marginStart: 25.w,
                              marginTop: 15.h,
                              marginBottom: 15.h,
                              textColor: primaryColor),
                        ),
                        Obx(()=> CustomText(
                              text: '${controller.notCorrectCounter.value}',
                              fontSize: 18.h,
                              marginStart: 8.w,
                              marginTop: 15.h,
                              marginBottom: 15.h,
                              textColor: Colors.red),
                        ),
                      ],
                    ),
                    Obx(()=> CustomText(
                        text: '${controller.seconds.value.toString().padLeft(2, '0')} : ${controller.minutes.value.toString().padLeft(2, '0')}',
                          fontSize: 18.h,
                          marginEnd: 12.w,
                          marginTop: 15.h,
                          marginBottom: 15.h,
                          textColor: MainController.themeData.value.indicatorColor),
                    ),
                  ]),
                Expanded(
                        child: SingleChildScrollView(
                        primary: true,
                          child: Column(
                            children: [
                              CustomText(
                                  text: Get.arguments['courseName'],
                                  fontSize: 20.h,
                                  bold: true,
                                  marginTop: 15.h,
                                  marginBottom: 15.h,
                                  marginStart: 15.w,
                                  textColor: MainController.themeData.value.indicatorColor),
                              Row(children: [Obx(()=>
                                  Checkbox(
                                      fillColor: MaterialStateColor.resolveWith((states) =>
                                      MainController.themeData.value.primaryColor),
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      value: controller.isFavQuesCheck.value,
                                      onChanged: (val){controller.isFavQuesCheck.value = val!;}
                                  ),
                              ),
                                CustomText(
                                  text: "عرص الأسئلة المفضلة فقط",
                                  fontSize: 16.h,
                                  textColor: MainController.themeData.value.indicatorColor),]),

                      Row(children: [Obx(()=>
                          Checkbox(
                              fillColor: MaterialStateColor.resolveWith((states) =>
                              MainController.themeData.value.primaryColor),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              value: controller.isCorrectQuesCheck.value,
                              onChanged: (val){controller.isCorrectQuesCheck.value = val!;}
                          ),
                      ),
                        CustomText(
                          text: "عرص الأسئلة الصحيحة فقط",
                          fontSize: 16.h,
                          textColor: MainController.themeData.value.indicatorColor),]),

                           CustomText(
                            text: "فلترة حسب التصنيف",
                            fontSize: 20.h,
                            bold: true,
                            marginTop: 15.h,
                           marginStart: 8.w,
                           textColor: MainController.themeData.value.indicatorColor),
                            Divider(thickness: 0.8,color: MainController.themeData.value.indicatorColor.withOpacity(0.5)),

                            Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomText(
                                        text: "إضافة ملاحظات",
                                        fontSize: 16.h,
                                        marginStart: 8.w,
                                        textColor: MainController.themeData.value.indicatorColor),
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(end: 8.w),
                                      child: Icon(Ionicons.add_circle_outline, size: 28.h,
                                        color: MainController.themeData.value.indicatorColor,),
                                    )
                                  ]),
                              Container(
                                margin: EdgeInsetsDirectional.symmetric(vertical: 12.h),
                                padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                    color: MainController.themeData.value.dividerColor,
                                    borderRadius: BorderRadius.circular(8.r)
                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Ionicons.information_circle_outline, size: 35.h,
                                            color: MainController.themeData.value.primaryColor,),
                                          CustomText(
                                              text: "اختر الإجابة المناسبة",
                                              fontSize: 18.h,
                                              bold: true,
                                              marginStart: 12.w,
                                              textColor: textColor)
                                        ]),
                              ]),),

                              controller.isLoading.value ?
                              Column(children:
                                controller.shimmer.map((e) => Column(
                                  children: [
                                    ShimmerWidget(child: Container(
                                                height: 50.h,
                                                decoration: BoxDecoration(
                                                    color: primaryColor,
                                                  borderRadius: BorderRadius.circular(5.r)
                                                ),
                                                margin: EdgeInsetsDirectional.symmetric(vertical: 12.h, horizontal: 12.w),
                                              )),
                                Column(children: controller.shimmerQues.map((e) => Row(
                                  children: [
                                    ShimmerWidget(child: Container(
                                      height: 30.h,
                                      width: 30.w,
                                      decoration: const BoxDecoration(
                                          color: primaryColor,
                                          shape: BoxShape.circle
                                      ),
                                      margin: EdgeInsetsDirectional.only(top: 12.h, bottom: 12.h, end: 8.w, start: 12.w),
                                    )),
                                    ShimmerWidget(child: Container(
                                      height: 30.h,
                                      width: width - 100.w,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.circular(5.r)
                                      ),
                                      margin: EdgeInsetsDirectional.only(top: 12.h, bottom: 12.h),
                                    )),
                                  ],
                                )).toList())])).toList()):
                              controller.courseExam.isEmpty ?
                              CustomText(text: 'لم يتم إضافة أسئلة لهذه الدورة بعد',
                                  textColor: MainController.themeData.value.indicatorColor,
                                  alignment: AlignmentDirectional.center,
                                 marginTop: 40.h,
                                ) :
                              Column(
                                children: controller.courseExam.map((element) {
                                   var index = controller.courseExam.indexOf(element);
                                   List<String?> options = [controller.courseExam[index].answerOne,
                                     controller.courseExam[index].answerTwo,
                                     controller.courseExam[index].answerThree,
                                     controller.courseExam[index].answerFour];

                                  return Obx(()=> courseQuestion(controller.courseExam[index].question,
                                        context, controller.radioBtnValues[index], index + 1, options,
                                        controller.iconsAns![index].obs,
                                        controller.courseExam[index].correctAnswer! + 1,
                                       controller.colorsOptions[index].obs, controller.courseExam[index].hint, controller.courseExam[index].tagName ?? '',
                                        ()=> controller.checkAns(index, controller.radioBtnValues[index], false)
                                    ),
                                  );
                                 }).toList()
                              ),
                            ],
                          ),
                        ),
                      )
                ],
              ),
            ),
          ),
          ),
      ),
    );
  }
  Widget courseQuestion(String? question, BuildContext context, RxInt? radioValue, int? questionNo,
      List<String?> options, RxMap<String, dynamic> icons, int correctAns, RxMap<String, dynamic> colors,
      String? hint, String? course, VoidCallback? correctQues) {
    final width = MediaQuery.of(context).size.width;

    final snackBar = SnackBar(
      backgroundColor: secondaryColor,
      duration: const Duration(seconds: 5),
      action: SnackBarAction(label: 'إخفاء',
        textColor: yellow,
        onPressed: () {},),
      content: CustomText(
          text: hint,
          fontSize: 18.h,
          fontFamily: 'Almarai',
          textColor:  MainController.themeData.value.dividerColor),
    );
    RxBool isLiked = false.obs;

    changeFav() {
      if (isLiked.value) {
        isLiked.value = false;
      } else {
        isLiked.value = true;
      }
    }

    return SizedBox(
      width: width,
      child: Column(
        children: [
          Container(
            width: width,
            margin: EdgeInsetsDirectional.only(top: 12.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: '$questionNo - $question',
                    fontSize: 18.h,
                    width: 280.w,
                    marginStart: 8.w,
                    textColor: MainController.themeData.value.indicatorColor),
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 8.w),
                  child: Icon(Ionicons.ellipsis_vertical_outline, size: 22.h),
                ),
              ],
            ),
          ),
          const Divider(thickness: 0.8,color: textColor),
          ...List.generate(
            options.length,
                (index) => option(
                  options[index],
                  colors['${index+1}']!,
                  radioValue!,
                  index + 1, icons['${index+1}'] ?? [])
               //   (){controller.checkAnsOne(index, radioValue);},),
          ),

          Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: correctQues,
                  child: Icon(Ionicons.checkmark_circle_outline, size: 33.h, color: MainController.themeData.value.indicatorColor,)),
              Obx(()=> InkWell(
                  overlayColor:MaterialStateColor.resolveWith((states) => Colors.transparent),
                  onTap: ()=> changeFav(),
                  child: isLiked.value ? Icon(Ionicons.heart, size: 33.h, color: pink):
                  Icon(Ionicons.heart_outline, size: 33.h, color: pink))),
              InkWell(
                  overlayColor:MaterialStateColor.resolveWith((states) => Colors.transparent),
                  onTap: ()
                  {ScaffoldMessenger.of(context).showSnackBar(snackBar);},
                  child: Icon(Ionicons.bulb_outline, size: 30.h, color: yellow,)),
              Icon(Ionicons.document_attach_outline, size: 33.h,
              color: MainController.themeData.value.indicatorColor,
              ),
            ],),
          SizedBox(height: 15.h),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsetsDirectional.only(start: 15.w),
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(15.r)
              ),
              width: 125.w,
              padding: EdgeInsetsDirectional.symmetric(vertical: 8.h, horizontal: 1.w),
              child: CustomText(
                  text: '$course' ,
                  fontSize: 18.h,
                  textAlign: TextAlign.center,
                  alignment: AlignmentDirectional.center,
                  textColor: greyLite ),),
          ),
          SizedBox(height: 15.h,)
        ],
      ),
    );
  }

  Widget option(String? answer, Rx<Color> textColor, RxInt radioValue, int? val, dynamic icons)
  {return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Obx(()=> RadioListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 0.0),
            activeColor: MainController.themeData.value.primaryColor,
           secondary: icons?.value == true?
           const Icon(Ionicons.checkmark_outline, color: primaryColor) : icons.value == false?
             const Icon(Ionicons.close_outline, color: red): null,
            title: Transform.translate(
              offset: const Offset(12, 0),
              child: CustomText(text: answer,
                  fontSize: 18.h,
                  textColor: textColor.value,
              ),
            ),
            value: val,
            onChanged: (val) {
              radioValue.value = val!;
            //  checkAns();
            },
            groupValue: radioValue.value,
          ),
          ),
        ),
      ],
    );
  }
}

