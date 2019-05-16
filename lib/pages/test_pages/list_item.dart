import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:xiang_flutter/router/route_center.dart';
import 'package:xiang_flutter/pages/test_pages/model.dart';
// import 'package:xiang_flutter/services/service_center.dart';

class RecommendItem extends StatefulWidget {
  final SimilarData model;

  RecommendItem(this.model);

  @override
  RecommendItemState createState() => new RecommendItemState();
}

class RecommendItemState extends State<RecommendItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String hashTagName = "";
    bool likeStatus = false;
    if ((widget.model.data?.hashtags?.length ?? 0) > 0) {
      HashTagModel tagModel = widget.model.data?.hashtags?.first;
      hashTagName = tagModel.name;
    }
    likeStatus = ((widget.model?.data?.likeStatus ?? 0) == 0) ? false : true;
    return GestureDetector(
      onTap: () => _jumpToInfo(widget.model?.data?.topicId ?? ""),
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        elevation: 1.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: <Widget>[
          _headerView(),
          Padding(
              padding: EdgeInsets.all(7.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.model?.data?.topicTitle ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff303231),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 5),
                  ]))
        ]),
      ),
    );
  }

  Widget _headerView() {
    bool sentHidden = !(widget.model?.isSent == true);
    bool videoHidden = !(widget.model?.isVideo == true);

    double imageWidth = (MediaQuery.of(context).size.width - 25.0) / 2.0;
    double height = double.parse(widget.model?.data?.height ?? '0');
    double width = double.parse(widget.model?.data?.width ?? '0');
    double imageHeight = imageWidth;
    if (width != 0) {
      imageHeight = (height / width) * imageWidth;
    }
    if (imageHeight > 350) {
      imageHeight = 350;
    }

    String imageUrl = (widget.model?.data?.topicPic ?? "") +
        '?imageMogr2/thumbnail/!65p/auto-orient';

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          width: imageWidth,
          height: imageHeight,
        ),
        Offstage(
            offstage: sentHidden,
            child: Image.asset(
              'assets/images/sent_topic.png',
              height: 100.0,
              width: 100.0,
            )),
        Positioned(
            top: 12,
            right: 6,
            child: Offstage(
                offstage: videoHidden,
                child: Image.asset('assets/images/detail_thanks_video.png',
                    height: 20, width: 20))),
      ],
    );
  }

  void _jumpToInfo(topicId) {
    RouteCenter.resolve(
        'ImageListPerformanceTest', {'topicId': topicId}, context);
  }
}
