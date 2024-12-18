import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:flutter/material.dart';

class CustomAppbarHome extends StatelessWidget {
  const CustomAppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.21,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64)),
        color: ColorsApp.kPrimaryColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: [
            Column(children: [
              Text(S.of(context).Welcomeback , style: TextStyle(color: Colors.white,fontSize: 14),),
              Text('John Safwat', style: TextStyle(color: Colors.white,fontSize: 24))
            ],),
          
            IconButton(onPressed: (){}, icon: Icon(Icons.light)),
            IconButton(onPressed: (){}, icon: Icon(Icons.translate_sharp)),
          ],),


        ],
      )
      
    );
  }
}