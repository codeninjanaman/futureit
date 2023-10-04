import 'package:futureit/Dashboard/dashboard.dart';
import 'package:futureit/authentication_repositary/authentication_repositary.dart';
import 'package:futureit/user_info/pancard.dart';
import 'package:get/get.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async{
    var isVerified = await AuthenticationRepositary.instance.verifyOTP(otp);
    isVerified? 
    Get.to(PanCardUploadPage())
    : Get.back();
  }
}