import 'package:admin_flutter/app/pages/widget/dash_board/dashboard_widget.dart';
import 'package:flutter/material.dart';

import '../../../platform/platform_adapter.dart';
import 'menu_model.dart';

class DashboardModel with ChangeNotifier {
  bool openFullScreen = false;

  List<MenuItem> selectedMenuList = [];

  MenuItem? _selectedMenuItem;

  final List<MenuItem> menus = [];

  set selectedMenuItem(v) {
    _selectedMenuItem = v;
    if (!selectedMenuList.contains(v)) {
      selectedMenuList.add(v);
    }
    notifyListeners();
  }

  MenuItem? get selectedMenuItem => _selectedMenuItem;

  void init() {
    if (_selectedMenuItem == null) {
      _selectedMenuItem = menus.first.items?.first;
      selectedMenuList.add(_selectedMenuItem!);
    }
  }

  void openOrCloseFullScreen(BuildContext context) {
    openFullScreen = !openFullScreen;
    platformAdapter.requestFullscreen(openFullScreen);
    DashboardWidget.of(context)?.openOrCloseLeftMenu(open: openFullScreen);
    DashboardWidget.of(context)?.openOrCloseSetting(open: openFullScreen);
    notifyListeners();
  }

}