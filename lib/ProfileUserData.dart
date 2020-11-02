import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'globals.dart';

class ProfileUserData<T> {
  final String collection;

  ProfileUserData({this.collection});

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> updateUserDataWithMap(mapProfileUser) {
    DocumentReference userRef =
        firestore.collection(collection).doc(mapProfileUser["uid"]);
    userRef.set(mapProfileUser, SetOptions(merge: true));
  }

  Future<T> getUserData(String uid) {
    DocumentReference userRef = firestore.collection(collection).doc(uid);
    return userRef.get().then((v) => Global.models[T](v.data()) as T);
  }


}
