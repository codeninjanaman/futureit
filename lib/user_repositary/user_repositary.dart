import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:futureit/authentication/models/user_model.dart';
import 'package:get/get.dart';

class UserRepositary extends GetxController{
  static UserRepositary get instance => Get.find();

  // final _db = FirebaseFirestore.instance;
  final _db = FirebaseFirestore.instance;

   Future<void> createUser(UserModel user)async{
   await _db.collection('Users').add(user.toJson()).whenComplete((){
    Get.snackbar("Success", "Your account has been created",
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green.withOpacity(0.1),
    colorText: Colors.green);
   }
    ).catchError((error,StackTrace){
      Get.snackbar("Error", "Something went wrong, Try again namannn",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent.withOpacity(0.1),
      colorText: Colors.red);
    });
  }

  Future<UserModel> getUserDetails(String email)async{
    final snapshot = await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }
 
  Future<List<UserModel>> allUser()async{
    final snapshot = await _db.collection("Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateuserRecord(UserModel user)async{
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }

}