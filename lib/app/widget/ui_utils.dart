import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../base/config/font_config.dart';
import '../../base/utils/util.dart';

/// @description: 创建通用text field
///  [textEditingController] 控制器
///  [textAlign] 文本位置
///  [hintText] 占位文案
///  [fontSize] 文本大小
///  [keyboardType] 键盘类型
///  [maxLength] 最大输入字数
///  [obscureText] 是否加密
///  [isExpanded] 是否铺满
///  [focusNode]
///  [hintStyle] 占位字体样式
///  [style] 内容字体样式
///  [textInputAction]
///  [contentPadding] 内容内边距
///  [maxLines] 最大行数
///  [minLines] 最小行数
///  [onChange] 输入监听
///  [onTap] 点击事件
Widget createNormalTFWidget({
  required BuildContext context,
  TextAlign textAlign = TextAlign.start,
  TextEditingController? textEditingController,
  String? hintText,
  double? fontSize = 14,
  TextInputType? keyboardType,
  int? maxLength,
  bool obscureText = false,
  bool isExpanded = true,
  FocusNode? focusNode,
  TextStyle? hintStyle,
  TextStyle? style,
  TextInputAction? textInputAction,
  List<TextInputFormatter>? inputFormatters,
  Brightness? keyboardAppearance,
  EdgeInsetsGeometry? contentPadding,
  Widget? prefixIcon,
  Widget? suffixIcon,
  int? maxLines = 1,
  InputDecoration? decoration,
  int? minLines,
  Function(String value)? onChange,
  Function? onTap,
  bool? enabled,
  Color? cursorColor,
  Function? onEditingComplete,
}) {
  Widget body = TextField(
    keyboardType: keyboardType,
    textAlign: textAlign,
    maxLines: maxLines,
    minLines: minLines,
    obscureText: obscureText,
    enabled: enabled,
    maxLength: maxLength,
    inputFormatters: inputFormatters,
    style: style ?? FontConfig.fontMedium12LightGrey,
    controller: textEditingController,
    focusNode: focusNode,
    textInputAction: textInputAction ?? TextInputAction.go,
    keyboardAppearance: keyboardAppearance,
    decoration: decoration ??
        InputDecoration(
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          prefixIcon: prefixIcon,
          counterText: "",
          contentPadding: contentPadding,
          hintText: hintText,
          hintStyle: hintStyle ?? FontConfig.fontMedium12LightGrey,
        ),

    cursorColor: cursorColor,
    onTap: () {
      if (onTap != null) {
        onTap();
      }
    },
    onChanged: (value) {
      if (onChange != null) {
        onChange(value);
      }
    },
    onEditingComplete: () {
      keyDismiss(context);
      if (onEditingComplete != null) onEditingComplete();
    },
  );
  if (isExpanded) {
    body = Expanded(child: body);
  }
  return body;
}
