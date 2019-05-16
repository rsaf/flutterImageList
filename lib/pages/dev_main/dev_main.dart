import 'package:flutter/material.dart';
import 'package:xiang_flutter/widgets/app_bar.dart';
import 'package:xiang_flutter/widgets/styles/styles.dart';
import 'package:xiang_flutter/router/route_center.dart';
import 'package:flutter/cupertino.dart';

typedef Navigation = void Function(BuildContext context);

class DevItem {
  String title;
  Navigation navigation;

  DevItem(this.title, this.navigation);
}

class DevMainPage extends StatelessWidget {
  List<DevItem> getItems() {
    DevItem imageListPerformanceTest = DevItem('go to test page', (context) {
      RouteCenter.resolve('ImageListPerformanceTest',
          {'topicId': '746F1B5W1P0X64383350393008'}, context);
    });

    return [imageListPerformanceTest];
  }

  @override
  Widget build(BuildContext context) {
    List<DevItem> items = getItems();
    return Scaffold(
        appBar: XWSAppBar("Home", XWSStyle.dark, context),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              DevItem item = items[index];
              return ListTile(
                title: Text(item.title), // item 标题
                trailing: Icon(Icons.keyboard_arrow_right), // item 后置图标
                isThreeLine: false, // item 是否三行显示
                dense: true, // item 直观感受是整体大小
                enabled: true,
                onTap: () {
                  item.navigation(context);
                },
              );
            }));
  }
}
