import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/init/init_config.dart';
import 'app/init/local/i18_tr.dart';
import 'app/router/app_router.dart';
import 'base/utils/util.dart';

void main() {
  init();
}

void init() async {
  await configInit();
  runApp(const MyApp());
}

initConfig() {
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

initRunApp() {
  if (!kIsWeb) {
    initConfig();
  }


  Widget body = initGetMaterialApp();
  return body;
}

initRootGestureDetector({
  Widget? child,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      keyDismiss(
        context,
      );
    },
    child: child,
  );
}

Widget initGetMaterialApp({
  Widget Function(BuildContext, Widget?)? builder,
}) {
  return GetMaterialApp(

    initialRoute: AppRouter.configNormalRouts(),
    getPages: AppRouter.getAllRoutS(),
    defaultTransition: Transition.rightToLeft,
    /// 本地支持语言
    supportedLocales: const [
      Locale('zh', 'CN'),
      Locale('en', 'US'),
    ],
    useInheritedMediaQuery: true,
    translations: I18TRMessages(),
    fallbackLocale: const Locale('zh', 'CN'),
    /// 是否显示 导航栏右上角 debug 标识
    debugShowCheckedModeBanner: false,
    /// 国际化配置 代理
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate, // ios
    ],

    builder: builder,
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget body = initGetMaterialApp();

    return body;
  }
}
