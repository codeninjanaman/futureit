import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel{
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;
  // final String fathername;

 UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    required this.password,
    // required this.fathername
    }
  );

  String name = "sfnj";
  // String uid = FirebaseAuth.instance.currentUser?.uid ??'';

  toJson(){
    return{
      // "uid":uid,
      "FullName": fullName,
      'Email': email,
      'Phone' : phoneNo,
      'Password' : password,
      // 'FatherName': fathername
    };
  }


  // map user fetched from firebase

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return UserModel(
      id: document.id,
      fullName: data['FullName'],
      email: data['Email'] ,
      phoneNo: data['Phone'],
      password: data['Password'],
      // fathername : data['FatherName']
      );
  }

}