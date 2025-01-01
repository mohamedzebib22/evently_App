import 'package:evently_app/constants/const.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDetails extends StatelessWidget {
   CustomDetails({super.key , required this.date ,required this.time});
  String date;
  String time;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: height*0.02),
      padding: EdgeInsets.symmetric(horizontal: width*0.02),
      height: height*0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsApp.kPrimaryColor , width: 2),
        color: Colors.transparent
      ),
      child: Row(children: [
        Image.asset(dateLogo),
        SizedBox(width: width*0.02,),
        Column(children: [
          Text(date, style: TextStyle(color: ColorsApp.kPrimaryColor,)),
          
          Text(time, style: TextStyle(fontSize: 16),),
        ],)
      ],),
      
    );
  }
}