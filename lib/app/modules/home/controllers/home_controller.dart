import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ScrollController scrollController =
      new ScrollController(keepScrollOffset: true);

  @override
  void onInit() {
    super.onInit();
    scrollController = new ScrollController(keepScrollOffset: true);
  }

  @override
  void onReady() {
    super.onReady();
    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {}

  onStageTap(int stageNo) {
    scrollController.animateTo(Get.height * stageNo,
        curve: Curves.easeIn, duration: Duration(milliseconds: 500));
    update();
  }

  _scrollListener() {}
}
