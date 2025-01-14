import 'package:flutter/material.dart';

class ShowLoading {
  static void showLoading({required BuildContext context ,required String msg}){
    showDialog(context: context,
     builder: (context){
      return AlertDialog(
        content: Row(children: [
          CircularProgressIndicator(),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
          Text(msg , style: TextStyle(fontSize: 16),)
        ],),
      );

     });
  }

  static void hideLoading({required BuildContext context}){
    Navigator.pop(context);
  }
}