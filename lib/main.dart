import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:futureit/authentication_repositary/authentication_repositary.dart';
import 'package:futureit/controller/otpcontroller.dart';
import 'package:futureit/firebase_options.dart';
import 'package:futureit/onboardingscreen.dart';
import 'package:futureit/theme.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepositary())).then((value) => Get.put(OTPController()));
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: onboarding(),
      initialBinding: BindingsBuilder(() {
        Get.put(ThemeController());
      }),
    );
  }
}