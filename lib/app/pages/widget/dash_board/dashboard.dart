import 'package:admin_flutter/app/pages/widget/dash_board/dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dash_model.dart';
import 'left_menu_page.dart';
import 'menu_model.dart';

/// @author jd

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  State createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    DashboardModel model = context.watch<DashboardModel>();
    model.init();
    List<MenuItem> menus = model.menus;
    MenuItem selectedMenuItem = model.selectedMenuItem!;
    Widget content = selectedMenuItem.buildWidget(context);
    return DashboardWidget(
      leftMenu: LeftMenuPage(
        items: menus,
        selectedItem: selectedMenuItem,
        itemChanged: (MenuItem item) {
          model.selectedMenuItem = item;
        },
      ),
      mainPage: Container(
        constraints: const BoxConstraints(minWidth: 1000),
        child: Column(
          children: [
            MainTopWidget(selectedMenuList: model.selectedMenuList, selectedMenuItem: model.selectedMenuItem),
            Expanded(child: content),
          ],
        ),
      ),
      endDrawer: const SettingPage(),
    );
  }
}
