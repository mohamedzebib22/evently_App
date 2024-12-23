import 'package:evently_app/models/colors_app.dart';
import 'package:flutter/material.dart';

class CardEvent extends StatelessWidget {
  const CardEvent({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      
      margin: EdgeInsets.all(height * 0.01),
      width: width * 0.91,
      height: height * 0.30,
      decoration: BoxDecoration(
        border: Border.all(width: 3,color: ColorsApp.kPrimaryColor),
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: AssetImage('assets/images/bookclub.png'),
              fit: BoxFit.fill)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(6),
            padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.008),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text('21',
                    style: TextStyle(
                        color: ColorsApp.kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                Text('NOV',
                    style: TextStyle(
                        color: ColorsApp.kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ],
            ),
          ),
          
          Spacer(),
          Container(
            margin: EdgeInsets.all(6),
            height: height*0.05,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(children: [
              SingleChildScrollView(child: Text('Meeting for Updating The Development Method ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)),
              Spacer(),
              Icon(Icons.favorite_border_outlined ,color: Colors.amber,),
            ],),
          ),
        ],
      ),
    );
  }
}
