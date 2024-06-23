import 'package:admin_flutter/base/config/font_config.dart';
import 'package:admin_flutter/base/config/normal_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../base/utils/screen_utils.dart';
import 'menu_model.dart';


/// @author jd

// ignore: must_be_immutable
class LeftMenuPage extends StatelessWidget {
  LeftMenuPage({
    Key? key,
    this.itemChanged,
    this.selectedItem,
    required this.items,
  }) : super(key: key) {
    selectedItem ??= items.first.items?.first;
  }
  final ValueChanged<MenuItem>? itemChanged;
  MenuItem? selectedItem;
  final List<MenuItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.only(right: 3),
      child: Container(
        decoration: const BoxDecoration(
          color: NormalColorS.colF5F7FA,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(3.0, 0.0), //阴影xy轴偏移量
              blurRadius: 5.0, //阴影模糊程度
              spreadRadius: 1.0, //阴影扩散程度
            ),
          ],
        ),
        child: Column(
          children: [
            _topTitleWidget(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: items
                    .map(
                      (e) => _firstItemWidget(context, e, model),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topTitleWidget() {
    return SafeArea(
      bottom: false,
      child: Container(
        height: ScreenUtils.isMobile() ? 44 : 60,
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 18,
              height: 18,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '后台管理系统',
              style: FontConfig.fontBold18Black,
            ),
          ],
        ),
      ),
    );
  }

  Widget _firstItemWidget(
      BuildContext context, MenuItem firstItem) {
    int index = items.indexOf(firstItem);

    /// 更改ExpansionTile主题 可使用Theme或collapsedIconColor
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme:
            const ColorScheme.light(primary: NormalColorS.col9a9a9a),
        unselectedWidgetColor: model.theme.menuPrimaryTextColor,
      ),
      child: ExpansionTile(
        expandedAlignment: Alignment.bottomRight,
        collapsedIconColor: model.theme.menuPrimaryTextColor,
        initiallyExpanded: index == 0 ? true : false,
        iconColor: model.theme.menuPrimaryTextColor,
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        tilePadding: const EdgeInsets.only(left: 25, right: 20),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              firstItem.iconData,
              color: model.theme.menuPrimaryTextColor,
              size: 16,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              firstItem.title ?? '',
              style: TextStyle(
                color: model.theme.menuPrimaryTextColor,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        children: firstItem.items!
            .map(
              (e) => _secondItemWidget(context, e, model),
            )
            .toList(),
      ),
    );
  }

  Widget _secondItemWidget(
      BuildContext context, menu.MenuItem secondItem, AppTheme model) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: InkWell(
        onTap: () {
          if (ScreenUtils.isMobile()) {
            Navigator.of(context).pop();
          }
          if (itemChanged != null) {
            itemChanged!(secondItem);
          }
        },
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: selectedItem == secondItem
                ? model.theme.menuSubSelectedBackgroundColor
                : model.theme.menuSubBackgroundColor,
          ),
          child: Center(
            child: SizedBox(
              height: 30,
              child: Text(
                secondItem.title ?? '',
                style: TextStyle(
                  fontSize: 12,
                  color: selectedItem == secondItem
                      ? model.theme.menuSelectedTextColor
                      : model.theme.menuSubTextColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
