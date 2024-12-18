

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/screens/home.dart';
import 'package:evently_app/screens/loves.dart';
import 'package:evently_app/screens/maps.dart';
import 'package:evently_app/screens/profile.dart';
import 'package:flutter/material.dart';

class DefultPage extends StatefulWidget {
  const DefultPage({super.key});
  static String id = 'DefultPage';
  @override
  State<DefultPage> createState() => _DefultPageState();
}

class _DefultPageState extends State<DefultPage> {
  List<Widget> pageList=[
    Home(),MapsPage(),LovesPage(),ProfilePage(),
  ];
    int selectIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton( 
        
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.white,
            width: 3
          )
        ),
        backgroundColor: ColorsApp.kPrimaryColor,
        onPressed: (){} , child: Icon(Icons.add),),
      bottomNavigationBar:BottomNavyBar (
      
        backgroundColor: ColorsApp.kPrimaryColor,
        selectedIndex: selectIndex,
        onItemSelected: (index){
            selectIndex =index;
            setState(() {
   
            });
        },
        items: [
        BottomNavyBarItem(icon: Icon(Icons.home_outlined), activeColor: Colors.white ,title: Text( S.of(context).Home , style: TextStyle(color: Colors.white))),
        BottomNavyBarItem(icon: Icon(Icons.gps_fixed_outlined), activeColor: Colors.white,title: Text(S.of(context).Maps , style: TextStyle(color: Colors.white),)),
        BottomNavyBarItem(icon: Icon(Icons.favorite_border_outlined), activeColor: Colors.white,title: Text( S.of(context).Lovs,style: TextStyle(color: Colors.white))),
        BottomNavyBarItem(icon: Icon(Icons.personal_injury_outlined), activeColor: Colors.white,title: Text( S.of(context).Profile,style: TextStyle(color: Colors.white))),
      ],),

      body: pageList[selectIndex],
    );
  }
}
