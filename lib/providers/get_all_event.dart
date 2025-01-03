import 'package:evently_app/models/event.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:flutter/material.dart';

class GetAllEventProvider extends ChangeNotifier {
  List<String> eventsNameList = [
    "ALl",
    "sport",
    "Birthday",
    "Metting",
    "Gaming",
    "WorkShop",
    "BookClub",
    "Exhibtion",
    "Holiday",
    "Eating",
  ];
  int selectIndex = 0;
  List<Event> eventList = [];

  getDatafromFirestore() async {
    var querySnapshot = await FirebaseUtils.getEventCollection()
        .orderBy('date', descending: true)
        .get();
    eventList = querySnapshot.docs.map((docs) {
      return docs.data();
    }).toList();

    notifyListeners();
  }

  getIsFavofiteDataFromFirestore() async {
    var querySnapshot = await FirebaseUtils.getEventCollection()
        .where('isFavorite', isEqualTo: true)
        .orderBy('date', descending: true)
        .get();

    eventList = querySnapshot.docs.map((docs) {
      return docs.data();
    }).toList();
    notifyListeners();
  }

  //-----------------
  getFilterDatafromFirestore() async {
    var querySnapshot = await FirebaseUtils.getEventCollection()
        .where('nameEvent', isEqualTo: eventsNameList[selectIndex])
        .get();
    eventList = querySnapshot.docs.map((docs) {
      return docs.data();
    }).toList();
    notifyListeners();
  }

  changeDate(int currentIndex) async {
    selectIndex = currentIndex;
    if (selectIndex == 0) {
      return getDatafromFirestore();
    } else {
      return getFilterDatafromFirestore();
    }
  }
}
