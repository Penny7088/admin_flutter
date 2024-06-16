import 'package:admin_flutter/app/pages/login/view.dart';
import 'package:get/get.dart';

import '../pages/login_1/view.dart';
import '../pages/main/main_view.dart';
import '../pages/splash/view.dart';

/// FileName app_router
///
/// @Author mac
/// @Date 2024/5/29 10:41
///
/// @Description TODO

class AppRouter{

  static getAllRoutS() {
    return [
      GetPage(
        name: RouterId.splash,
        page: () => const SplashPage(),
      ),
      GetPage(
        name: RouterId.splash,
        page: () => const MainPage(),
      ),
      GetPage(
        name: RouterId.login,
        page: () => const LoginPage(),
      ),
      GetPage(
        name: RouterId.login1,
        page: () => const Login1Page(),
      ),
      // ...ShopRouterS.routerS
    ];
  }

  // 设置默认入口页
  static configNormalRouts() {
    return RouterId.login1;
  }
}

class RouterId {
  static const String splash = '/app/splash';
  static const String main = '/app/main';
  static const String login = '/app/login';
  static const String login1 = '/app/login1';
}