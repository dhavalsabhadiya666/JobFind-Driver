import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingView {
  static Widget postLoadingView() => Container(
        height: Get.height,
        width: Get.width,
        color: Colors.black26,
        child: getLoadingView(),
      );

  static Center getLoadingView() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
