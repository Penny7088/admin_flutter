import 'package:admin_flutter/base/config/font_config.dart';
import 'package:admin_flutter/base/utils/extensions/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/config/normal_colors.dart';
import '../../../base/view/common_base_view.dart';
import '../../../generated/assets.dart';
import '../../widget/circle_progress.dart';
import 'controller.dart';

/// FileName view
///
/// @Author mac
/// @Date 2024/5/29 10:54
///
/// @Description TODO

class LoginPage extends CommonBaseView<LoginController> {
  const LoginPage({super.key});

  @override
  LoginController get controller => Get.put(LoginController(controllerTag()), tag: controllerTag());

  @override
  String controllerTag() {
    return 'LoginController';
  }

  @override
  Widget createChildBody({required BuildContext context, BoxConstraints? constraints}) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: NormalColorS.col000000,
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          child: Column(children: [
            Text('gexArchitecture'.tr, style: FontConfig.fontMedium16LightWhite),
            60.height,
            _loginPanel(),
          ]),
        ),
        Positioned(bottom: 0, left: 0, right: 0, child: Image.asset(Assets.imagesLoginBottomBj))
      ]),
    );
  }

  Widget _loginPanel() {
    Widget body =
        Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('gexArchitecture'.tr, style: FontConfig.fontMedium18LightGrey),
      30.height,
      Text('Email Address'.tr, style: FontConfig.fontMedium14LightGrey),
      10.height,
      _textEdit(hintText: 'input email/username'.tr, textController: controller.state.userName),
      20.height,
      Text('Password'.tr, style: FontConfig.fontMedium14LightGrey),
      10.height,
      _textEdit(hintText: 'input password'.tr, obscureText: true, textController: controller.state.password),
      30.height,
      _login()
    ]);
    return Container(
        width: 927,
        height: 647,
        margin: const EdgeInsets.symmetric(horizontal: 50),
        padding: const EdgeInsets.symmetric(horizontal: 50),
        decoration:
            const BoxDecoration(color: NormalColorS.colffffff, borderRadius: BorderRadius.all(Radius.circular(20))),
        child: body);
  }

  Widget _textEdit({required String hintText, bool? obscureText, TextEditingController? textController}) {
    return TextField(
      controller: textController,
      maxLines: 1,
      autofocus: true,
      textAlignVertical: TextAlignVertical.top,
      style: const TextStyle(fontSize: 14, color: Color(0xFF202020), height: 10 / 7),
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF6F6F6),
        hintText: hintText,
        counterText: "",
        hintStyle: const TextStyle(fontSize: 14, color: NormalColorS.col999999, height: 10 / 7),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(width: 1, color: NormalColorS.cole6e6e6)),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(width: 1, color: NormalColorS.cole6e6e6)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      ),
      onChanged: (str) {},
    );
  }

  Widget _login(){
   Widget body;
   if(!controller.state.isClickLogin.value){
     body = Text('Sign in'.tr, style: FontConfig.fontMedium16LightWhite);
   }else{
     body = const CircleProgress();
   }
   return GestureDetector(
        onTap: () {
          controller.login();
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 53,
          decoration:
          const BoxDecoration(color: NormalColorS.col000000, borderRadius: BorderRadius.all(Radius.circular(10))),
          child: body,
        ));
  }
}
