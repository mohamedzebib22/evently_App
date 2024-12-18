import 'package:evently_app/models/colors_app.dart';
import 'package:flutter/material.dart';

class CustomProfileAppbar extends StatelessWidget {
  const CustomProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.21,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64)),
        color: ColorsApp.kPrimaryColor
      ),
      child: Row(children: [
        Container(
          margin: EdgeInsets.all(24),
          padding: EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width*0.31,
          height: MediaQuery.of(context).size.height*0.21,
          decoration: BoxDecoration(
           
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(1000),
              bottomLeft: Radius.circular(1000),
              bottomRight: Radius.circular(1000),
            ),
            image: DecorationImage(image: AssetImage('assets/images/route.png'),fit: BoxFit.fill)
          ),
         
        ),
     
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('Mohamedsamir' , style: TextStyle(fontSize: 20 ,color: Colors.white),),
            Text('Mohamedsamir@yahoo.com',style: TextStyle(fontSize: 16,color: Colors.white))
          ],),
        )
      ],),
    );
  }
}