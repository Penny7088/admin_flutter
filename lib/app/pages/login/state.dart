
import 'package:admin_flutter/app/init/init_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/state/page_state.dart';

/// FileName state
///
/// @Author mac
/// @Date 2024/5/29 10:53
///
/// @Description

class LoginState extends BaseState {

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  var isClickLogin = false.obs;

  LoginState() {
    print('LoginState');
  }

  @override
  void release() {
    userName.clear();
    userName.dispose();
    password.clear();
    userName.dispose();
  }
}