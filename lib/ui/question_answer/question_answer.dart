import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/interviews/interviews_controller.dart';
import 'package:key_app/ui/question_answer/question_answer_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/widget/custom_text.dart';
import 'package:key_app/widget/drawer.dart';

class QuestionsAnswers extends GetView<QuestionsAnswersController> {
  const QuestionsAnswers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Get.put(QuestionsAnswersController());
    return Obx(()=> Scaffold(
        key: controller.questionsAnswersKey,
        drawer: Drawer(child: drawer()),
        body: SafeArea(
          child: SizedBox(
            width: width,
            child: Column(
              children: [
                Container(
                  width: width, height: 85.h,color: MainController.themeData.value.primaryColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 12.w, left: 18.w),
                        child: InkWell(
                            onTap: (){ controller.questionsAnswersKey.currentState!.openDrawer();},
                            child: Icon(Ionicons.menu_sharp, color: MainController.themeData.value.dividerColor, size: 35.h,)),
                      ),
                      CustomText(
                          text: "أطفال 1",
                          fontSize: 20.h,
                          bold: true,
                          alignment: AlignmentDirectional.center,
                          textColor: MainController.themeData.value.dividerColor),
                    ],),),
                //  SizedBox(height: 15.h,),
                Expanded(
                  child: SizedBox(
                    width: width,
                   child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 12,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index)=>
                            questionAnswerItem('الوريد المصاب بالغالاكوريفينا يزداد إصابيته بتجرثم الدم عند الوريد بال ؟',
                                context, index+1, 'E COLI'),
                      ),),
                )
              ],
            ),
          ),
        )
    ),
    );
  }
  Widget questionAnswerItem(String? question, BuildContext context, int? questionNo, String? answer) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        width: width,
        margin: EdgeInsetsDirectional.symmetric(vertical: 8.h),
        child:
        Row(children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Center(
                      child: Container(

                        decoration: BoxDecoration(
                       shape: BoxShape.circle,
                          color: yellow.withOpacity(0.5)
                        ),
                     child: CustomText(text: '$questionNo', textColor: MainController.themeData.value.primaryColor ,),
                      )
                //      Icon(Ionicons.newspaper_outline, color: MainController.themeData.value.hintColor, size: 35.h,)
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: '$questionNo',
                        fontSize: 18.h,
                        bold: true,
                        marginBottom: 12.h,
                        marginTop: 8.h,
                        textColor:MainController.themeData.value.indicatorColor),
                    CustomText(
                        text: 'عدد الأسئلة: $questionNo',
                        fontSize: 16.h,
                        textColor: MainController.themeData.value.indicatorColor),
              ],
            ),
            Divider(thickness: 0.8,color: MainController.themeData.value.indicatorColor.withOpacity(0.5))
          ],
        ),
    );
  }

}
