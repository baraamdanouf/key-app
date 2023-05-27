import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/ui/course_questions/course_questions_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/widget/custom_text.dart';

class CourseQuestions extends GetView<CourseQuestionsController> {
  const CourseQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Get.put(CourseQuestionsController());
    return  Scaffold(
        key: controller.courseQuestionsKey,
        floatingActionButton: SpeedDial(
          iconTheme: IconThemeData(color: Colors.red),
          curve: Curves.bounceIn,
          backgroundColor: primaryColor,
          overlayOpacity: 0,
          animatedIcon: AnimatedIcons.menu_arrow,
          children: [
            SpeedDialChild(
                label: 'شغل المؤقت',
                child: Icon(Ionicons.stopwatch_outline, size: 12.h,)
            ),
            SpeedDialChild(
                label: 'شغل المؤقت',
                child: Icon(Ionicons.stopwatch_outline)
            ),
            SpeedDialChild(
                label: 'شغل المؤقت',
                child: Icon(Ionicons.stopwatch_outline)
            ),
            SpeedDialChild(
                label: 'شغل المؤقت',
                child: Icon(Ionicons.stopwatch_outline)
            )
          ],
        ),
        body: SafeArea(
          child: SizedBox(
            width: width,
            child: Column(
              children: [
                Container(
                  width: width, height: 85.h,color: primaryColor,
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 18.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: 18.w),
                        child: Icon(Ionicons.menu_sharp, color: Colors.white, size: 35.h,),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              text: "أطفال 1",
                              fontSize: 20.h,
                              bold: true,
                              alignment: AlignmentDirectional.center,
                              textColor: Colors.white),
                          CustomText(
                              text: "دورة 2020 - 2021, الفصل الأول",
                              fontSize: 15.h,
                              marginTop: 8.h,
                              alignment: AlignmentDirectional.center,
                              textColor: Colors.white),
                        ],
                      ),
                    ],
                    ),
                      Icon(Ionicons.search_outline, color: Colors.white, size: 30.h,),
                    ],),),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CustomText(
                              text: "0",
                              fontSize: 18.h,
                              marginStart: 25.w,
                              marginTop: 15.h,
                              textColor: textColor),
                          CustomText(
                              text: "0",
                              fontSize: 18.h,
                              marginStart: 8.w,
                              marginTop: 15.h,
                              textColor: textColor),
                        ],
                      ),
                      CustomText(
                          text: "00:00",
                          fontSize: 18.h,
                          marginEnd: 12.w,
                          marginTop: 15.h,
                          textColor: textColor),

                    ]),
                CustomText(
                    text: "دورة 2020 - 2021, الفصل الأول",
                    fontSize: 20.h,
                    marginStart: 25.w,
                    marginTop: 25.h,
                    bold: true,
                    marginBottom: 12.h,
                    textColor: textColor),
                CustomText(
                    text: "عدد الأسئلة: 8",
                    fontSize: 18.h,
                    marginStart: 25.w,
                    marginBottom: 12.h,
                    textColor: textColor),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      margin: EdgeInsetsDirectional.symmetric(horizontal: 25.w),
                      child: Column(
                        children: [
                          Row(children: [Obx(()=>
                              Checkbox(
                                  fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  value: controller.isFavQuesCheck.value,
                                  onChanged: (val){controller.isFavQuesCheck.value = val!;}
                              ),
                          ), CustomText(
                              text: "عرص الأسئلة المفضلة فقط",
                              fontSize: 16.h,
                              //   marginStart: 8.w,
                              textColor: textColor),]),
                          Row(children: [Obx(()=>
                              Checkbox(
                                  fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  value: controller.isCorrectQuesCheck.value,
                                  onChanged: (val){controller.isCorrectQuesCheck.value = val!;}
                              ),
                          ),
                            CustomText(
                              text: "عرص الأسئلة الصحيحة فقط",
                              fontSize: 16.h,
                              //   marginStart: 8.w,
                              textColor: textColor),]),
                          CustomText(
                              text: "فلترة حسب التصنيف",
                              fontSize: 20.h,
                              bold: true,
                              marginTop: 15.h,
                              textColor: textColor),

                          const Divider(thickness: 0.8,color: textColor),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomText(
                                    text: "إضافة ملاحظات",
                                    fontSize: 16.h,
                                    textColor: textColor),
                                Icon(Ionicons.add_circle_outline, size: 28.h)
                              ]),
                          Container(
                            margin: EdgeInsetsDirectional.symmetric(vertical: 12.h),
                            padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w, vertical: 12.h),
                            decoration: BoxDecoration(
                                color: greyLite,
                                borderRadius: BorderRadius.circular(8.r)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Ionicons.information_circle_outline, size: 35.h, color: primaryColor,),
                                      CustomText(
                                          text: "اختر الإجابة المناسبة",
                                          fontSize: 18.h,
                                          bold: true,
                                          marginStart: 12.w,
                                          textColor: textColor)
                                    ]),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width,
                            child: Expanded(
                              child: ListView.builder(
                                primary: false,
                                scrollDirection: Axis.vertical,
                                clipBehavior: Clip.none,
                                itemCount: 12,
                                shrinkWrap: true,
                                itemBuilder: (context, index)=>
                                    courseQuestion('الوريد المصاب بالغالاكوريفينا يزداد إصابيته بتجرثم الدم عند الوريد بال ؟',
                                        context, (index+1).obs, 'E COLI', 'جراحة عصبية'),
                              ),
                            ),
                          ),
                        ],
                      ),),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
  Widget courseQuestion(String? question, BuildContext context, RxInt? questionNo, String? answer, String? course) {
    final width = MediaQuery.of(context).size.width;
    final snackBar = SnackBar(
      backgroundColor: secondaryColor,
      duration: const Duration(seconds: 5),
      action: SnackBarAction(label: 'إخفاء',
        textColor: yellow,
        onPressed: () {},),
      content: CustomText(
          text: 'صمم استقبالي' ,
          fontSize: 18.h,
          textColor: Colors.white),

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
                    text: '$questionNo - $question ' ,
                    fontSize: 18.h,
                    width: 280.w,
                    textColor: Colors.black),
                Icon(Ionicons.ellipsis_vertical_outline, size: 22.h),
              ],
            ),
          ),
          const Divider(thickness: 0.8,color: textColor),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Obx(()=> RadioListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                  activeColor: primaryColor,
                  title:  Transform.translate(
                    offset: const Offset(12, 0),
                    child: CustomText(text: '$answer' ,
                        fontSize: 18.h,
                        textColor: Colors.black),
                  ),
                  value: 1,
                  onChanged: (val) {
                    questionNo.value = val!;
                  },
                  groupValue:  questionNo!.value,
                ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Obx(()=> RadioListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                  activeColor: primaryColor,
                  title:  Transform.translate(
                    offset: const Offset(12, 0),
                    child: CustomText(text: '$answer' ,
                        fontSize: 18.h,
                        textColor: Colors.black),
                  ),
                  value:2,
                  onChanged: (val) {
                    questionNo.value = val!;
                  },
                  groupValue:  questionNo!.value,
                ),
                ),
              ),
            ],
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Obx(()=> RadioListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                  activeColor: primaryColor,
                  title:  Transform.translate(
                    offset: const Offset(12, 0),
                    child: CustomText(text: '$answer' ,
                        fontSize: 18.h,
                        textColor: Colors.black),
                  ),
                  value: 3,
                  onChanged: (val) {
                    questionNo.value = val!;
                  },
                  groupValue: questionNo!.value,
                ),
                ),
              ),

            ],
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Ionicons.checkmark_circle_outline, size: 33.h),
              Obx(()=> InkWell(
                  overlayColor:MaterialStateColor.resolveWith((states) => Colors.transparent),
                  onTap: ()=> changeFav(),
                  child: isLiked.value ? Icon(Ionicons.heart, size: 33.h, color: pink):
                  Icon(Ionicons.heart_outline, size: 33.h, color: pink))),
              InkWell(
                  overlayColor:MaterialStateColor.resolveWith((states) => Colors.transparent),
                  onTap: ()
                  {ScaffoldMessenger.of(context).showSnackBar(snackBar);},
                  child: Icon(Ionicons.bulb_outline, size: 30.h, color: Colors.yellow,)),
              Icon(Ionicons.document_attach_outline, size: 33.h,),
            ],),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
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
                  textColor: Colors.white),),
          ),
          SizedBox(height: 15.h,)
        ],
      ),
    );
  }

}
