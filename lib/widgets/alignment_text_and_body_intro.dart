import 'package:flutter/material.dart';

class AlignmentTextAndBodyIntro extends StatelessWidget {
  AlignmentTextAndBodyIntro({super.key , required this.text, required this.itemColor,required this.itemSize});
  String text;
  Color itemColor;
  double itemSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(text,style: TextStyle(color:itemColor, fontSize: itemSize ),)],
    );
  }
}
