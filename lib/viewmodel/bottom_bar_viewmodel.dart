import 'package:get/get.dart';

class BottomBarViewModel extends GetxController {
  bool _isDrawerVisible = false;

  bool get isDrawerVisible => _isDrawerVisible;

  void setIsDrawerVisible() {
    _isDrawerVisible = !_isDrawerVisible;
    update();
  }
}
