// import 'package:flutter/material.dart';
// import 'package:futureit/user_info/gender.dart';

// class pancard extends StatefulWidget {
//   const pancard({super.key});

//   @override
//   State<pancard> createState() => _pancardState();
// }

// class _pancardState extends State<pancard> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 16, 16, 16),
//         body: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
              
//               children: [
//                 Text('Enter your PAN',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16
//                     ),),

//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text('PAN is compulsory for investment in Bharat',
//                     style: TextStyle(
//                       color: Colors.white,
                    
//                     )
//                     ),
//                     SizedBox(height: 30,),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
                    

//                     SizedBox(
//             height: 60,
//             child: TextFormField(
//               style: TextStyle(color: Colors.white),
//               // controller: controller.fullName,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 focusedBorder: OutlineInputBorder( //<-- SEE HERE
//       borderSide: BorderSide(
//           width: 1, color: Colors.white), 
//     ),
//                 label: Text("BYJKP6402P",
//                 style: TextStyle(fontSize: 15,
//                 color: Colors.white),),
//                 // prefixIcon: Icon(Icons.person_outline_rounded,
//                 // color: Colors.white,),
//                 // border: OutlineInputBorder(),
                
//                 labelStyle: TextStyle(color: Colors.white),
              
//                 // focusedBorder: OutlineInputBorder(
//                 //   borderSide: BorderSide(width: 2.0,
//                 //   color:Colors.white)
//                 // )
                
//               )
//             ),
//           ),
//           SizedBox(height: 500,),
//           SizedBox(
//                   height: 50,
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
//                     ),
//                     onPressed: (){
//                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => gender()));
//                     },
//                    child: Text('CONTINUE',
//                    style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18
//                    ),)),
//                 )
//                   ],
//                 ),

                
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:futureit/authentication/models/user_model.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/user_info/adhaarcard/adharcard1.dart';
import 'package:futureit/user_info/gender.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PanCardUploadPage extends StatefulWidget {
  @override
  _PanCardUploadPageState createState() => _PanCardUploadPageState();
}

class _PanCardUploadPageState extends State<PanCardUploadPage> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final _db = FirebaseFirestore.instance;
  // String id = _db.collection("Users").document().getId();
  File? _selectedImage;
  String? _downloadUrl;

  Future<void> _selectImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_selectedImage == null) {
      // Handle no image selected error
      return;
    }
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;
    // DocumentReference documentReference = _firestore.collection('Users').doc();
    // DocumentSnapshot snapshot = await documentReference.get();
    // String documentid = snapshot.id;
    
    // final Reference storageRef = _storage.ref().child('pan_card_images').child('$uid.jpg');

    final Reference storageRef = _storage.ref().child('pancard_images').child('$uid.jpg');

    final UploadTask uploadTask = storageRef.putFile(_selectedImage!);

    final TaskSnapshot downloadSnapshot = await uploadTask;
    final String downloadUrl = await downloadSnapshot.ref.getDownloadURL();

    await _storeDownloadUrlInFirestore(downloadUrl);

    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => adhaarcardscreenone(),
                    ),
                  );
  }

  
  
  

  Future<void> _storeDownloadUrlInFirestore(String downloadUrl) async {

    // DocumentReference documentReference = _firestore.collection('Users').doc();
    // DocumentSnapshot snapshot = await documentReference.get();
    // String documentid = snapshot.id;
    final Map<String, dynamic> data = {
      'panCardImageUrl': downloadUrl,
    };

    User? user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;
    // Replace 'users' and 'userId' with your Firestore collection and document ID
    await _firestore.collection('Users').doc('$uid').set(data, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  
                  Color(0xFF110C2C),
                  Color(0xFFD69A38),
                ],
                stops: [0.41,0.7]
              )
            ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
            padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
    
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Verify PAN Card",
                    
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 19
                    ),),
                  ),
                  SizedBox(height: 8,),
                  Text('A PAN Card is compulsory for investing in india. This is one-time setup & takes less than a minute.',
                  style: TextStyle(
                    color: Colors.white
                  ),),
                  SizedBox(height: 80,),
    
                  // Display selected image or a placeholder
                  _selectedImage != null
                      ? Image.file(
                          _selectedImage!,
                          width: 200,
                          height: 200,
                        )
                      :
                      DottedBorder(
                        color: Pallete.color2,//color of dotted/dash line
                strokeWidth: 2, //thickness of dash/dots
                dashPattern: [10,6],
                
                       
                        child:Container(
                        height: 150,
                        width: double.infinity,
                        
                        // color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                           OutlinedButton(onPressed: _selectImage,
                           child: Text('Upload PAN Card',
                           style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                           ),),
                           style: ButtonStyle(
                            // shape: BeveledRectangleBorder(),
            side: MaterialStateProperty.all(
              BorderSide(
                color: Colors.white, // Set the desired border color here
                width: 1.0,
                 // Set the desired border width here
              ),
            ),
          )),
          Text.rich(
                        TextSpan(children: [
                          TextSpan(text: "Supported file types:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                          )),
                          TextSpan(text: "PDF/JPG",
                          style: TextStyle(color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold ))
                        ]
                        )
                      )
                            
                          ],
                        )
                      ), ),
                       
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: _selectImage,
                    child: Text('Select another image',
                    style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                  
                  SizedBox(height: 150),
            
                  // Button to select an image
                  
            
                  // Button to upload the selected image
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      
                      onPressed: _uploadImage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Pallete.color1,
                        shape: BeveledRectangleBorder()
                      ),
                      child: Text('Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),),
                    ),
                  ),
            
                  SizedBox(height: 20),
            
                  // Display the download URL if available
                  if (_downloadUrl != null)
                    Text(
                      'Download URL: $_downloadUrl',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
