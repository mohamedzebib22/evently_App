import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/event.dart';

class FirebaseUtils {
  static CollectionReference<Event> getEventCollection() {
    return FirebaseFirestore.instance
        .collection(Event.collectionName)
        .withConverter<Event>(fromFirestore: (snapshot, options) {
      return Event.fromFirstore(snapshot.data());
    }, toFirestore: (event, _) {
      return event.toFireStore();
    });
  }

  static Future<void> addEvent(Event event) {
   
    var collection = getEventCollection();
    var docRef = collection.doc();
    event.id = docRef.id;
    return docRef.set(event);
  }
}
