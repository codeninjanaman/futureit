import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'theme.dart';

class Pallete{
  User? user = FirebaseAuth.instance.currentUser;

  static String documentId = '';

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
  static const color1= Color(0xFF110C2C);
  static const color2= Color(0xFFD69A38);
  static var black1 = Color(0xFF110C2C);
  static var white = Colors.white;
  static var black2 = Color(0xFF110C2C).withOpacity(0.7);
  static var black3 = Colors.black.withOpacity(0.85);
  static var black4 = Colors.black.withOpacity(0.95);
  static var yellow1 = Color(0xFFF3BA2F);
  static var black = Colors.black;


  static Color get textColor {
    return Get.find<ThemeController>().isDarkMode ? Colors.white : Colors.black;
  }
  
}