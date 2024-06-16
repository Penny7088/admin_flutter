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

class Login1Page extends CommonBaseView<Login1Controller> {
  const Login1Page({super.key});

  @override
  Login1Controller get controller => Get.put(Login1Controller(controllerTag()), tag: controllerTag());

  @override
  String controllerTag() {
    return 'Login1Controller';
  }

  @override
  Widget createChildBody({required BuildContext context, BoxConstraints? constraints}) {
    return Container(
      color: NormalColorS.cole6e6e6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(flex:1,child: _leftPanel()),
            Flexible(flex:1,child:_rightPanel()),
          ],
        ));
  }

  Widget _leftPanel() {
    Widget body =
        Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Sign In'.tr, style: FontConfig.fontBold302B3674),
      10.height,
      Text('Enter your email and password to sign in!'.tr, style: FontConfig.fontMedium14LightGrey),
      15.height,
      _googleLogin(),
      20.height,
      _splitOr(),
      20.height,
      Text('Email*'.tr, style: FontConfig.fontBold14Black),
      10.height,
      _textEdit(hintText: 'input email/username'.tr, textController: controller.state.userName),
      20.height,
      Text('Password*'.tr, style: FontConfig.fontBold14Black),
      20.height,
      Text('Password'.tr, style: FontConfig.fontMedium14LightGrey),
      10.height,
      _textEdit(hintText: 'input password'.tr, obscureText: true, textController: controller.state.password),
      30.height,
      _login()
    ]);
    return Container(padding:const EdgeInsets.symmetric(horizontal: 50),child: body);
  }

  Widget _rightPanel() {
    double width = MediaQuery.of(Get.context!).size.width/2;
    double height = MediaQuery.of(Get.context!).size.height;
    return  SizedBox(width:width,height:height,child: Image.asset(Assets.imagesLoginBg1,width:height,height:height));
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

  Widget _login() {
    Widget body;
    if (!controller.state.isClickLogin.value) {
      body = Text('Sign in'.tr, style: FontConfig.fontMedium16LightWhite);
    } else {
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
              const BoxDecoration(color: NormalColorS.col4318ff, borderRadius: BorderRadius.all(Radius.circular(10))),
          child: body,
        ));
  }

  Widget _googleLogin() {
    Widget body;
    if (!controller.state.isClickLogin.value) {
      body = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.imagesLoginGoogle,
            width: 30,
            height: 30,
          ),
          10.width,
          Text('Sign in with Google'.tr, style: FontConfig.fontBold162B3674)
        ],
      );
    } else {
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
              const BoxDecoration(color: NormalColorS.colf4f7fe, borderRadius: BorderRadius.all(Radius.circular(15))),
          child: body,
        ));
  }

  Widget _splitOr(){
    return Container(child: Text('------------------------------------------------------- or -----------------------------------------------------------------------',style: FontConfig.fontMedium14LightGrey,maxLines: 1,),);
  }
}
