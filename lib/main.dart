import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:telescope_driver/viewmodel/auth_viewmodel.dart';
import 'package:telescope_driver/viewmodel/bottom_bar_viewmodel.dart';
import 'views/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('MY INITIAL COMMIT');
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },
    );
  }

  /// CONTROLLER INIT..
  AuthViewModel _authViewModel = Get.put(AuthViewModel());
  BottomBarViewModel _barViewModel = Get.put(BottomBarViewModel());
}
