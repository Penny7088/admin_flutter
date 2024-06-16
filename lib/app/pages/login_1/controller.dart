import 'package:admin_flutter/app/pages/splash/state.dart';
import 'package:admin_flutter/base/utils/getx_util_tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../base/controller/common_controller.dart';
import 'state.dart';

/// FileName controller
///
/// @Author mac
/// @Date 2024/5/29 10:52
///
/// @Description  controller

class Login1Controller extends CommonController<Login1State> {

  Login1Controller(String tag){
    controllerTag = tag;
  }

  @override
  void onInit() {
    debugPrint('onInit=========== $controllerTag');
    super.onInit();
  }

  @override
  Login1State createState() {
    debugPrint('createState======= $controllerTag');
   return Login1State();
  }


  @override
  configUI() {
  debugPrint('configUI=======');
   isShowBottomBar = false;
   isShowAppBar = false;
  safeAreaTop = false;
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
    Get.delete<Login1Controller>(tag: controllerTag);
  }

  void login() {
    if(state.userName.text.isEmpty){
      showSnackBar(title:'User name error'.tr,msg: 'please input user name'.tr);
      return;
    }

    if(state.password.text.isEmpty){
      showSnackBar(title:'Password error'.tr,msg: 'please input password'.tr);
      return;
    }

    state.isClickLogin.value = true;

    if (state.userName.text == 'admin' && state.password.text == '123456') {

      debugPrint('enter home page ..');
    }
  }


}