import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/event.dart';
import 'package:evently_app/models/myuser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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

  static CollectionReference<MyUser> getUserCollection(){
    return FirebaseFirestore.instance.collection(MyUser.collectionName).withConverter(
    fromFirestore: (snapshot,_){
      return MyUser.getDatafromUserFromFireStore(snapshot.data());
    }, 
    toFirestore: (myUser,_){
      return myUser.addDataToFireStore();
    });
  }

  static Future<void> addUserToFireStore(MyUser myUser){
    return getUserCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> readUserFromFireStore(String id)async{
  var querySnapshot= await getUserCollection().doc(id).get();
    return querySnapshot.data();
  }

  static Future<void> addEvent(Event event) {
    var collection = getEventCollection();
    var docRef = collection.doc();
    event.id = docRef.id;
    return docRef.set(event);    
  }
}

