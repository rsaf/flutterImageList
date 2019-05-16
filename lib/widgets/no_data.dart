import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  
  final String imageName;
  final String tip;
  double _imageWidth;
  double _imageHeight;

  NoData(this.imageName, this.tip);

  static Widget size(String imageName, String tip, double width, double height) {
    return NoData.sizeWithImageSize(imageName, tip, width, height, null, null);
  }

  static Widget sizeWithImageSize(String imageName, String tip, double width, double height, double imageWidth, double imageHeight) {
    NoData nodate = NoData(imageName, tip);
    nodate._imageWidth = imageWidth;
    nodate._imageHeight = imageHeight;

    return Container(
      width: width,
      height: height,
      child: nodate,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _buildWidget(),
      ),
    );
  }

  List<Widget> _buildWidget() {
    List<Widget> widgets = [];
    if (imageName.isNotEmpty) {
      widgets.add(Image.asset(imageName, width: (_imageWidth != null) ? _imageWidth : null, height: (_imageHeight != null) ? _imageHeight : null,));
    }
    if (tip.isNotEmpty) {
      widgets.add(Text(tip));
    }
    return widgets;
  }
}