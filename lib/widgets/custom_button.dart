import 'package:evently_app/models/colors_app.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key , required this.title , required this.width});
  String title;
  double width;
  @override
  Widget build(BuildContext context) {
   
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      child: Container(
        width:width,
        height: height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorsApp.kPrimaryColor,
        ),
        child: Center(child: Text(title , style: TextStyle(color: Colors.white,fontSize: 20),)),
      ),
    );
  }
}
