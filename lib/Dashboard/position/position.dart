// // import 'package:flutter/material.dart';

// // class position extends StatefulWidget {
// //   const position({super.key});

// //   @override
// //   State<position> createState() => _positionState();
// // }

// // class _positionState extends State<position> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(child: Text('position')),
// //     );
// //   }
// // }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:get/get.dart';


// class UserProfilePage extends StatefulWidget {
//   @override
//   _UserProfilePageState createState() => _UserProfilePageState();
// }

// class _UserProfilePageState extends State<UserProfilePage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   String? panCardImageUrl;

//   @override
//   void initState() {
//     super.initState();
//     // Fetch the PAN card image URL when the widget initializes
//     fetchPanCardImageUrl();
//   }

//   // Function to fetch the PAN card image URL from Firebase Storage
//   Future<void> fetchPanCardImageUrl() async {
//     User? user = FirebaseAuth.instance.currentUser;
    
//     // DocumentReference documentReference = _firestore.collection('Users').doc();
//     // DocumentSnapshot snapshot = await documentReference.get();
//     // String documentid = snapshot.id;

//     if (user!= null) {
//       String uid = user.uid;
//       try {
//         final Reference storageRef =
//             // FirebaseStorage.instance.ref().child('pan_card_images/$uid.jpg');
//             FirebaseStorage.instance.ref().child('pan_card_images/$uid.jpg');
//         final String downloadURL = await storageRef.getDownloadURL();
        
//         setState(() {
//           panCardImageUrl = downloadURL;
//         });
//       } catch (e) {
//         print('Error retrieving PAN card image: $e');
//         Get.snackbar('dsb', '$uid',);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//     // DocumentReference documentReference = _firestore.collection('Users').doc();
//     // DocumentSnapshot snapshot = await documentReference.get();
//     // String documenid = snapshot.id;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             if (panCardImageUrl != null)
//               Image.network(
//                 panCardImageUrl!,
//                 width: 200,
//                 height: 200,
//                 // You can add other image properties here
//               )
//             else
//               CircularProgressIndicator()
           

//           ],
//         ),
//       ),
//     );
//   }
// }











import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AadhaarRetrieveScreen extends StatefulWidget {
  @override
  _AadhaarRetrieveScreenState createState() => _AadhaarRetrieveScreenState();
}

class _AadhaarRetrieveScreenState extends State<AadhaarRetrieveScreen> {
  String?  _aadhaarImageUrl;
  final FirebaseAuth _auth = FirebaseAuth.instance;

   @override
  void initState() {
    super.initState();
    // Fetch the PAN card image URL when the widget initializes
    _retrieveAadhaarImage();
  }

  Future<void> _retrieveAadhaarImage() async {
    final user = _auth.currentUser;
    if (user != null) {
      final userId = user.uid;
      final reference =
          FirebaseStorage.instance.ref().child('aadhaar_images/$userId.jpg');
      final url = await reference.getDownloadURL();
      setState(() {
        _aadhaarImageUrl = url;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User not authenticated')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Aadhaar Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _aadhaarImageUrl != null
                ? Image.network(_aadhaarImageUrl!,
                height: 200,
                width: 200,)
                : CircularProgressIndicator()
            // ElevatedButton(
            //   onPressed: _retrieveAadhaarImage,
            //   child: Text('Retrieve Aadhaar Image'),
            // ),
          ],
        ),
      ),
    );
  }
}
