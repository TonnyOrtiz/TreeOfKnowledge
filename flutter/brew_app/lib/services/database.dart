import 'package:brew_app/models/brewuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_app/models/brew.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  
  final String uid;
  DatabaseService({this.uid=''});

  // collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars' : sugars,
      'name' : name,
      'strength' : strength,
    });
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Brew(
        name: doc.get('name') ?? '',
        sugars: doc.get('sugars')?? '0',
        strength: doc.get('strength')?? 0,
      );
    }).toList();
  }

  // get brew stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
    .map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  // userData from snapshot 
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid, 
      name: snapshot.get('name'), 
      sugars: snapshot.get('sugars'), 
      strength: snapshot.get('strength')
    );
  }
}