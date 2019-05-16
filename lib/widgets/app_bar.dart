import 'package:flutter/material.dart';
import 'package:xiang_flutter/widgets/styles/styles.dart';
import 'package:xiang_flutter/router.dart';

class XWSAppBar extends AppBar {
  XWSAppBar(String title, XWSStyle style, BuildContext context,
      {List<Widget> actions, Function onBack})
      : super(
          title: Text(
            title,
            style:
                TextStyle(color: XWSColor.themeTitleColor(style), fontSize: 18),
          ),
          elevation: 0,
          backgroundColor: XWSColor.themeColor(style),
          brightness: Brightness.light,
          actions: actions,
          iconTheme: IconThemeData.fallback(),
          leading: IconButton(
            icon: XWSIcon.back(style),
            onPressed: () {
              RouterManager.pop(context);
              if (onBack != null) onBack();
            },
          ),
        );
}
