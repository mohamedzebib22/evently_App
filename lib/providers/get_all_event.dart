import 'package:evently_app/models/event.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  List<Event> filterEventList = [];
  List<Event> filterFavoritesList = [];

  getDatafromFirestore() async {
    var querySnapshot = await FirebaseUtils.getEventCollection()
        .orderBy('date', descending: true)
        .get();
    eventList = querySnapshot.docs.map((docs) {
      return docs.data();
    }).toList();
    filterEventList = eventList;
    notifyListeners();
  }

  getIsFavofiteDataFromFirestore() async {
    var querySnapshot = await FirebaseUtils.getEventCollection()
        .where('isFavorite', isEqualTo: true)
        .orderBy('date', descending: true)
        .get();

    filterFavoritesList = querySnapshot.docs.map((docs) {
      return docs.data();
    }).toList();
    notifyListeners();
  }

  //-----------------
  getFilterDatafromFirestore() async {
    var querySnapshot = await FirebaseUtils.getEventCollection()
        .where('nameEvent', isEqualTo: eventsNameList[selectIndex])
        .get();
    filterEventList = querySnapshot.docs.map((docs) {
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

  void updateFavorite(Event event) {
    FirebaseUtils.getEventCollection()
        .doc(event.id)
        .update({'isFavorite': !event.isFavorite!}).timeout(
            Duration(seconds: 1), onTimeout: () {
      print('Update Sucssefuly');
      selectIndex == 0 ? getDatafromFirestore() : getFilterDatafromFirestore();

      getIsFavofiteDataFromFirestore();
    });
  }
}
