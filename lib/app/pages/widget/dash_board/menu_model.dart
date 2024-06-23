import 'package:flutter/material.dart';

class MenuItem{
  final String? title;
  final String? iconPath;
  final List<MenuItem>? items;
  final String? route;
  final WidgetBuilder? builder;
  final bool delete;

  MenuItem({
    required this.title,
    this.iconPath,
    this.items,
    this.route,
    this.builder,
    this.delete = true,
  });

  Widget? _widget;

  Widget buildWidget(BuildContext context) {
    WidgetBuilder? widgetBuilder = builder;
    if (widgetBuilder != null) {
      return _widget ??= widgetBuilder.call(context);
    } else {
      return Container();
    }
  }


  MenuItem.first(this.title, this.iconPath, this.items)
      : route = null,
        builder = null,
        delete = false;

  MenuItem.second(this.title, this.route, {this.builder, this.delete = true})
      : iconPath = null,
        items = null;
}