import 'package:flutter/material.dart';
import 'package:futureit/authentication/models/user_model.dart';
import 'package:futureit/authentication_repositary/authentication_repositary.dart';
import 'package:futureit/user_repositary/user_repositary.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();

  

  final _authRepo = Get.put(AuthenticationRepositary());
  final _userRepo = Get.put(UserRepositary());
  //Get user email and password and pass to userrepo to fetch user record

  getUserData(){
    final email = _authRepo.firebaseUser.value?.email;
    if(email!= null){
      return _userRepo.getUserDetails(email);
    }
    else{
      Get.snackbar("Error", "Login to continue");
   
    }
  }

  Future<List<UserModel>> getAllUser() async{
    return await _userRepo.allUser();
  }

  updateRecord(UserModel user)async{
    await  _userRepo.updateuserRecord(user);
  }


}