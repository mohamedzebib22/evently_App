import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/models/theme_data.dart';
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
  List<Widget> pageList = [
    Home(),
    MapsPage(),
    LovesPage(),
    ProfilePage(),
  ];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(side: BorderSide(width: 4, color: Colors.white)),

        // backgroundColor: ColorsApp.kPrimaryColor,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          notchMargin: 8,
          padding: EdgeInsets.zero,
          child: BottomNavigationBar(
            
            elevation: 0,
            currentIndex: selectIndex,
            onTap: (index) {
              selectIndex = index;
              setState(() {});
            },
            items: [
              buildIconBottomBar(icon: Icon(Icons.home_outlined), index: 0, label: 'home',),
              buildIconBottomBar(icon: Icon(Icons.location_on), index: 1, label: 'maps',),
              buildIconBottomBar(icon: Icon(Icons.favorite_border_outlined), index: 2, label: 'loves'),
              buildIconBottomBar(icon: Icon(Icons.personal_injury_outlined), index: 3, label: 'profile')
            ],
          ),
        ),
      ),
      body: pageList[selectIndex],
    );
  }

  buildIconBottomBar(
      {required int index, required Widget icon, required String label}) {
    return BottomNavigationBarItem(icon: icon, label: label);
  }
}
