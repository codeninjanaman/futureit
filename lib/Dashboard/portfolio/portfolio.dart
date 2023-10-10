import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:get/get.dart';

class portfolio extends StatefulWidget {
  const portfolio({super.key});

  @override
  State<portfolio> createState() => _portfolioState();
}

class _portfolioState extends State<portfolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.color1,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1), // Set the height of the white border
            child: Container(
              color: Colors.grey, // Color of the white border
              height: 1, // Thickness of the white border
            ),
          ),
        backgroundColor: Pallete.color1,
        title: Text('Portfolio',
        style: TextStyle(
          color: Colors.white
        ),),

        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,
        color: Colors.white,))
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                
                
                style: TextStyle(color: Color(0xFFF3BA2F),
              
                fontSize: 14),
                
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,
                  color: Color(0xFFF3BA2F)),
                  contentPadding: EdgeInsets.only(bottom: 1,left: 14),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Color(0xFFF3BA2F),
                    fontSize: 13
      
                  ),
                  
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  
                  labelStyle: TextStyle(color: Pallete.color1 ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0,
                    color:Pallete.color2)
                  )
                  
                )
              ),
              SizedBox(height: 20,),
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Pallete.color2,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Total P&L',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13
                    ),),
                    SizedBox(height: 3,),
                    Text('+0.0000',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 13
                    ),)
                  ],
                ),
                
              ),

              SizedBox(height: 10,),
               
               Center(
                 child: Text.rich(
                         TextSpan(
                         text: "Total Positions : ",
                         style: TextStyle(color: Colors.white.withOpacity(0.8),
                         fontSize: 13),
                         children: [
                           TextSpan(
                             text: "0",
                             style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                             )
                           )
                         ]
                       )),
               ),

               SizedBox(height: 12,),
               

            ],
          ),
        )
      )
    );
  }
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:futureit/constants.dart';
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
    
    
//     // DocumentReference documentReference = _firestore.collection('Users').doc();
//     // DocumentSnapshot snapshot = await documentReference.get();
//     // String documentid = snapshot.id;

   
//       String docId = Pallete.documentId;
//       try {

        
//         final Reference storageRef =
//             // FirebaseStorage.instance.ref().child('pan_card_images/$uid.jpg');
//             FirebaseStorage.instance.ref().child('pan_card_images/$docId.jpg');
//         final String downloadURL = await storageRef.getDownloadURL();
        
//         setState(() {
//           panCardImageUrl = downloadURL;
//         });
//       } catch (e) {
//         print('Error retrieving PAN card image: $e');
        
//       }
    
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











// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AadhaarRetrieveScreen extends StatefulWidget {
//   @override
//   _AadhaarRetrieveScreenState createState() => _AadhaarRetrieveScreenState();
// }

// class _AadhaarRetrieveScreenState extends State<AadhaarRetrieveScreen> {
//   String?  _aadhaarImageUrl;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//    @override
//   void initState() {
//     super.initState();
//     // Fetch the PAN card image URL when the widget initializes
//     _retrieveAadhaarImage();
//   }

//   Future<void> _retrieveAadhaarImage() async {
//     final user = _auth.currentUser;
//     if (user != null) {
//       final userId = user.uid;
//       final reference =
//           FirebaseStorage.instance.ref().child('aadhaar_images/$userId.jpg');
//       final url = await reference.getDownloadURL();
//       setState(() {
//         _aadhaarImageUrl = url;
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('User not authenticated')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Retrieve Aadhaar Image'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _aadhaarImageUrl != null
//                 ? Image.network(_aadhaarImageUrl!,
//                 height: 200,
//                 width: 200,)
//                 : CircularProgressIndicator()
//             // ElevatedButton(
//             //   onPressed: _retrieveAadhaarImage,
//             //   child: Text('Retrieve Aadhaar Image'),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
