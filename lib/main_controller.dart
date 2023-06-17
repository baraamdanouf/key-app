import 'package:get/get.dart';
import 'package:key_app/utils/const_colors.dart';
import 'utils/shared_preferance/shared_preferance.dart';

class MainController extends GetxController{
   bool isDarkTheme = false;
   static dynamic themeData = ThemeService().lightTheme.obs;

  @override
  void onInit() async{
    super.onInit();
    isDarkTheme = SaveDateInSharedPreference.getTheming();
    SaveDateInSharedPreference.setTheming(isDarkTheme);
    themeData.value = isDarkTheme ? ThemeService().darkTheme : ThemeService().lightTheme;
    isDarkTheme ? Get.changeTheme(ThemeService().darkTheme) : Get.changeTheme(ThemeService().lightTheme);
    update();
  }
}