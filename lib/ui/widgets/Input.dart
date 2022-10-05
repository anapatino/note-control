import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  EdgeInsets? margin;
  EdgeInsets? padding;
  Color colorBorder;
  Color colorText;
  Input(this.controller, this.label, this.margin, this.padding,
      this.colorBorder, this.colorText);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: colorBorder))),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: label,
            hintStyle: TextStyle(color: colorText)),
      ),
    );
  }
}

class Position extends StatelessWidget {
  double left;
  double? top;
  double width;
  double? bottom;
  double? right;
  double height;
  String image;
  Position(
      {Key? key,
      required this.left,
      this.top,
      this.right,
      this.bottom,
      required this.width,
      required this.height,
      required this.image})
      : assert(left == null || right == null || width == null),
        assert(top == null || bottom == null || height == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      width: width,
      bottom: bottom,
      right: right,
      height: height,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/$image'))),
      ),
    );
  }
}
