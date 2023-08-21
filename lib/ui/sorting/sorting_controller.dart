import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_app/models/tag_model.dart';
import 'package:key_app/services/remote_services.dart';

class SortingController extends GetxController {
  final GlobalKey<ScaffoldState> sortingKey = GlobalKey<ScaffoldState>();
  RxList<TagModel> tags = RxList<TagModel>([]);
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchTags();
  }
  Future<List<TagModel>> fetchTags() async {
    List<dynamic> data = await getTags();
    tags.value = data.map((json) => TagModel.fromJson(json)).toList();
    isLoading.value = false;
    return tags;
  }
  @override
  void dispose() {
    super.dispose();
  }
}
