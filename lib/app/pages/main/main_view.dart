import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/view/common_base_view.dart';
import 'main_controller.dart';


class MainPage extends CommonBaseView<MainController> {
  const MainPage({super.key});

  @override
  MainController get controller => Get.put(MainController(controllerTag()), tag: controllerTag());

  @override
  String controllerTag() {
    return "MainController";
  }

  @override
  Widget createChildBody({required BuildContext context, BoxConstraints? constraints}) {
    return Container(width:double.infinity,height:double.infinity,child: Text('home'),);
  }
}
