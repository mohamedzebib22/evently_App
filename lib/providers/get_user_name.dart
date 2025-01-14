import 'package:evently_app/models/myuser.dart';
import 'package:flutter/foundation.dart';

class changeUserName extends ChangeNotifier{
  MyUser? currentUser;

  void changeUser(MyUser userName){
    currentUser =userName;
    notifyListeners();
  }
}