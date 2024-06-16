import 'package:admin_flutter/app/pages/splash/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../base/controller/common_controller.dart';

/// FileName controller
///
/// @Author mac
/// @Date 2024/5/29 10:52
///
/// @Description  controller

class SplashController extends CommonController<SplashState> {

  SplashController(String tag){
    controllerTag = tag;
  }

  @override
  void onInit() {
    debugPrint('onInit=========== $controllerTag');
    super.onInit();
  }

  @override
  SplashState createState() {
    debugPrint('createState======= $controllerTag');
   return SplashState();
  }


  @override
  configUI() {
  debugPrint('configUI=======');
   isShowBottomBar = false;
   isShowAppBar = false;
   debugPrint('state.runtimeType = ${state.runtimeType}');
   debugPrint('controller = ${this.runtimeType}');
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint('controller = ${controllerTag}');
  }

  @override
  void onClose() {
    super.onClose();
    Get.delete<SplashController>(tag: controllerTag);
  }


}