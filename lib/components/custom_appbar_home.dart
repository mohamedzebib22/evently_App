import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/providers/get_all_event.dart';
import 'package:evently_app/providers/get_user_name.dart';
import 'package:evently_app/widgets/tap_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppbarHome extends StatefulWidget {
  const CustomAppbarHome({super.key});

  @override
  State<CustomAppbarHome> createState() => _CustomAppbarHomeState();
}

class _CustomAppbarHomeState extends State<CustomAppbarHome> {
  @override
  Widget build(BuildContext context) {
    var userNameProvider = Provider.of<changeUserName>(context);
    var listProvider = Provider.of<GetAllEventProvider>(context);
    List<String> eventsNameList = [
      S.of(context).ALl,
      S.of(context).sport,
      S.of(context).Birthday,
      S.of(context).Metting,
      S.of(context).Gaming,
      S.of(context).WorkShop,
      S.of(context).BookClub,
      S.of(context).Exhibtion,
      S.of(context).Holiday,
      S.of(context).Eating
    ];
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.28,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64)),
            color: ColorsApp.kPrimaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      S.of(context).Welcomeback,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(userNameProvider.currentUser!.name,
                        style: TextStyle(color: Colors.white, fontSize: 24))
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.light_mode)),
                    Container(
                      margin: EdgeInsets.only(right: 12),
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('EN',
                          style: TextStyle(
                              color: ColorsApp.kPrimaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.location_on_outlined)),
                Text(
                  'Cariro , Egypt',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
            DefaultTabController(
              initialIndex: 0,
              length: eventsNameList.length,
              child: TabBar(
                tabAlignment: TabAlignment.start,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                labelPadding: EdgeInsets.zero,
                onTap: (index) {
                  listProvider.changeDate(index);
                },
                unselectedLabelColor: Colors.white,
                labelStyle: TextStyle(color: Colors.amber),
                isScrollable: true,
                tabs: eventsNameList.map((eventName) {
                  return TapWidget(
                    eventName: eventName,
                    isSelected:
                        listProvider.selectIndex == eventsNameList.indexOf(eventName)
                            ? true
                            : false,
                    selected: Colors.white,
                    unSelected: Colors.transparent,
                    selectedItem: ColorsApp.kPrimaryColor,
                    unselectedItem: Colors.white,
                    borderColor: Colors.white,
                  );
                }).toList(),
              ),
            )
          ],
        ));
  }
}
