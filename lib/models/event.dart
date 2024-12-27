import 'package:flutter/material.dart';

class Event {
  static String collectionName = 'Event';
  String? id;
  String? image;
  String? nameEvent;
  String? tilte;
  String? description;
  bool? isFavorite;
  DateTime date;
  String? time;
  Event(
      {this.id = '',
      required this.image,
      required this.nameEvent,
      required this.tilte,
      required this.description,
      this.isFavorite = false,
      required this.date,
      required this.time});
  //Method recive data from firebase
  //convert json to object
  Event.fromFirstore(Map<String, dynamic>? data) : this(
    id:data!['id'] ,
    image: data['image'],
    nameEvent: data['nameEvent'],
    tilte: data['tilte'],
    description: data['description'],
    isFavorite:data['isFavorite'] ,
    date:DateTime.fromMillisecondsSinceEpoch(data['date']),
    time: data['time'],
    
  );
  //Method pass data to firebase
  //convert object to json
  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'image': image,
      'nameEvent': nameEvent,
      'tilte': tilte,
      'description': description,
      'isFavorite': isFavorite,
      'date': date.millisecondsSinceEpoch,
      'time': time
    };
  }
}
