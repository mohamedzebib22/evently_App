import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/components/custom_appbar_home.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/event.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:evently_app/providers/get_all_event.dart';
import 'package:evently_app/providers/get_user_name.dart';
import 'package:evently_app/screens/get_desc_event.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:evently_app/widgets/card_event.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static String id = 'HomePage';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    var listProvider = Provider.of<GetAllEventProvider>(context);
    if (listProvider.eventList.isEmpty) {
      listProvider.getDatafromFirestore();
    }
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: CustomAppbarHome(),
          ),
          Expanded(
            child: listProvider.filterEventList.isEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(S.of(context).NoEvent,style: TextStyle(color:themeProvider.appTheme == ThemeMode.light ?Colors.black :Colors.white  ),),
                    ],
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: listProvider.filterEventList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, GetDescEvent.id,
                              arguments: listProvider.eventList[index]);
                        },
                        child: CardEvent(
                          event: listProvider.filterEventList[index],
                        ),
                      );
                    }),
          )
        ],
      ),
    );
  }
}
