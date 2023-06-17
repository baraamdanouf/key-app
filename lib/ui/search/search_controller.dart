import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_app/utils/shared_preferance/shared_preferance.dart';

class SearchController extends GetxController {
  final GlobalKey<ScaffoldState> searchKey = GlobalKey<ScaffoldState>();

   RxList<String> searchList = SaveDateInSharedPreference.getSearches().obs;
  final TextEditingController controllerSearch = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
