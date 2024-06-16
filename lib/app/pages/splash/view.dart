import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../base/config/normal_colors.dart';
import '../../../base/view/common_base_view.dart';
import 'controller.dart';

/// FileName view
///
/// @Author mac
/// @Date 2024/5/29 10:54
///
/// @Description TODO

class SplashPage extends CommonBaseView<SplashController>{
  const SplashPage({super.key});

  @override
  SplashController get controller => Get.put(SplashController(controllerTag()),tag: controllerTag());

  @override
  String controllerTag() {
   return 'SplashController';
  }

  @override
  Widget createChildBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: NormalColorS.colffffff,
      child: Text('gexArchitecture'.tr),
    );
  }

}