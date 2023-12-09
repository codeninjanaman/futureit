// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:futureit/Dashboard/dashboard.dart';
// import 'package:get/get.dart';
// import 'package:local_auth/local_auth.dart';

// class biometric extends StatelessWidget {
//   final LocalAuthentication _auth = LocalAuthentication();

//   Future<bool> _canAuthenticate() async =>
//       await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

//   Future<bool> _authenticate() async {
//     try {
//       if (!(await _canAuthenticate())) return false;

//       return await _auth.authenticate(localizedReason: "Authenticate to access the app");
//     } catch (e) {
//       print('Error: $e');
//       return false;
//     }
//   }
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Biometric Authentication'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 bool authenticated = await _authenticate();
//                 if (authenticated) {
//                   Get.to(Dashboard());
//                   print('Authentication successful');
//                 } else {
//                   // if the authentication is unsuccessful then we will first give 30 sec time waiting period
//                   // if he again fail then we will close the app 
//                   print('Authentication failed');
//                   SystemNavigator.pop();
//                 }
//               },
//               child: Text('Authenticate with Biometrics'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futureit/Dashboard/dashboard.dart';
import 'package:futureit/pin/entrypin.dart';
import 'package:futureit/pin/pin.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class BiometricScreen extends StatefulWidget {
  @override
  _BiometricScreenState createState() => _BiometricScreenState();
}

class _BiometricScreenState extends State<BiometricScreen> {
  final LocalAuthentication _auth = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    authenticateOnLoad();
  }

  Future<void> authenticateOnLoad() async {
    final pin = await getPin();
    bool authenticated = await _authenticate();
    if (authenticated) {
      Get.offAll(Dashboard());
      print('Authentication successful');
    } else {
      Get.offAll(()=>PinEntryScreen(pin!));
      // If the authentication is unsuccessful, you may want to handle this case accordingly.
      // For now, we will close the app.
      print('Authentication failed');
      // SystemNavigator.pop();
    }
  }

  Future<bool> _canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  Future<bool> _authenticate() async {
    try {
      if (!(await _canAuthenticate())) return false;

      return await _auth.authenticate(localizedReason: "Authenticate to access the app");
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Biometric Authentication'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator()
            // You can optionally show a loading indicator or message while authentication is in progress.
          ],
        ),
      ),
    );
  }
}
