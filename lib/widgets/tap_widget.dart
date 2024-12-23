import 'package:evently_app/models/colors_app.dart';
import 'package:flutter/material.dart';

class TapWidget extends StatelessWidget {
  TapWidget(
      {super.key,
      required this.eventName,
      required this.isSelected,
      required this.selected,
      required this.unSelected,
      required this.selectedItem,
      required this.borderColor,
      required this.unselectedItem});
  String eventName;
  bool isSelected;
  Color selected;
  Color unSelected;
  Color selectedItem;
  Color unselectedItem;
  Color borderColor;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(width * 0.01),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.01),
      decoration: BoxDecoration(
        color: isSelected ? selected : unSelected,
        border: Border.all(width: 2, color: borderColor),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        eventName,
        style: TextStyle(color: isSelected ? selectedItem : unselectedItem),
      ),
    );
  }
}
