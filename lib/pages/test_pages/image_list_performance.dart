import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:xiang_flutter/pages/test_pages/list_item.dart';
import 'package:xiang_flutter/services/service_center.dart';
import 'package:xiang_flutter/services/api/interface/test_api.dart';
import 'package:xiang_flutter/services/request/request_exception.dart';
import 'package:xiang_flutter/services/toast/toast_service.dart';
import 'package:xiang_flutter/pages/test_pages/model.dart';

class ImageListPerformanceTest extends StatefulWidget {
  final String topicId;

  ImageListPerformanceTest(this.topicId);

  @override
  _ImageListPerformanceTestState createState() =>
      _ImageListPerformanceTestState();
}

class _ImageListPerformanceTestState extends State<ImageListPerformanceTest> {
  List<SimilarData> dataList = [];

  @override
  void initState() {
    super.initState();
    _fetchList();
  }

  Future _fetchList() {
    return GlobalServiceCenter.request.post(TestApi.similarList, {
      'topicId': widget.topicId,
      'source': 'similar',
    }).then((map) {
      SimilarModel similarModel = SimilarModel.fromJson(map);
      setState(() {
        dataList.addAll(similarModel.data);
      });
    }).catchError((error) {
      if (error is XWSException) {
        String message = 'server error';
        ToastService.shared.toast(message);
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('image list crashing issue'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverStaggeredGrid.countBuilder(
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                crossAxisCount: 2,
                itemCount: (dataList.length ?? 0),
                staggeredTileBuilder: (int index) {
                  return StaggeredTile.fit(1);
                },
                itemBuilder: (BuildContext context, int index) {
                  print('---index---$index---');
                  return RecommendItem(dataList[index]);
                })
          ],
        ),
      ),
    );
  }
}
