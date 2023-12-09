// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:futureit/Dashboard/position/position.dart';
// import 'package:futureit/user_info/gender.dart';
// import 'package:image_picker/image_picker.dart';

// class AadhaarUploadScreen extends StatefulWidget {
//   @override
//   _AadhaarUploadScreenState createState() => _AadhaarUploadScreenState();
// }

// class _AadhaarUploadScreenState extends State<AadhaarUploadScreen> {
//   File? _selectedImage;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> _uploadAadhaarImage() async {
//     final user = _auth.currentUser;
//     if (user != null && _selectedImage != null) {
//       final userId = user.uid;
//       final reference =
//           FirebaseStorage.instance.ref().child('aadhaar_images/$userId.jpg');
//       await reference.putFile(_selectedImage!);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Aadhaar image uploaded successfully!')),
//       );
//       Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => gender(),
//                     ),
//                   );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please select an image')),
//       );
//     }
//   }

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//   final pickedImage = await picker.pickImage(source: ImageSource.gallery);

//   if (pickedImage != null) {
//     setState(() {
//       _selectedImage = File(pickedImage.path);
//     });
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('No image selected')),
//     );
//   }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Aadhaar Image'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _selectedImage != null
//                 ? Image.file(_selectedImage!,
//                 height: 200,
//                 width: 200,)
//                 : Text('No image selected'),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: Text('Select Aadhaar Image'),
//             ),
//             ElevatedButton(
//               onPressed: _uploadAadhaarImage,
//               child: Text('Upload Aadhaar Image'),
//             ),
//           ],
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
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AadhaarUploadScreen extends StatefulWidget {
  @override
  _AadhaarUploadScreenState createState() => _AadhaarUploadScreenState();
}

class _AadhaarUploadScreenState extends State<AadhaarUploadScreen> {
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

    String docID = Pallete.documentId;
    // DocumentReference documentReference = _firestore.collection('Users').doc();
    // DocumentSnapshot snapshot = await documentReference.get();
    // String documentid = snapshot.id;
    
    // final Reference storageRef = _storage.ref().child('pan_card_images').child('$uid.jpg');

    final Reference storageRef = _storage.ref().child('Adhaar_images').child('$docID.jpg');


    final UploadTask uploadTask = storageRef.putFile(_selectedImage!);

    final TaskSnapshot downloadSnapshot = await uploadTask;
    CircularProgressIndicator();
    final String downloadUrl = await downloadSnapshot.ref.getDownloadURL();

    await _storeDownloadUrlInFirestore(downloadUrl);
    
    // Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                   builder: (context) => gender(),
    //                 ),
    //               );
    Get.to(gender());
  }

  Future<void> _storeDownloadUrlInFirestore(String downloadUrl) async {

    // DocumentReference documentReference = _firestore.collection('Users').doc();
    // DocumentSnapshot snapshot = await documentReference.get();
    // String documentid = snapshot.id;
    final Map<String, dynamic> data = {
      'adhaarcardUrl': downloadUrl,
    };

    User? user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;
    String docID = Pallete.documentId;
    CircularProgressIndicator();
    // Replace 'users' and 'userId' with your Firestore collection and document ID
    await _firestore.collection('Users').doc('$docID').set(data, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        child: Scaffold(
          appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios,
        size: 18,
        color: Pallete.black1,))
      ),
          backgroundColor: Pallete.white,
          body: Center(
            child: Container(
            padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [

                        Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Upload Adhaar Card",
                    
                    style: TextStyle(
                      color: Pallete.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 19
                    ),),
                  ),
                  SizedBox(height: 8,),
                  Text('Adhaar Card is compulsory for verification in India.',
                  style: TextStyle(
                    color: Pallete.black
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
                        color: Colors.grey,//color of dotted/dash line
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
                           child: Text('Upload Adhaar Card',
                           style: TextStyle(
                            color: Pallete.black,
                            fontSize: 12
                           ),),
                           style: ButtonStyle(
                            // shape: BeveledRectangleBorder(),
            side: MaterialStateProperty.all(
              BorderSide(
                color: Pallete.black, // Set the desired border color here
                width: 1.0,
                 // Set the desired border width here
              ),
            ),
          )),
          Text.rich(
                        TextSpan(children: [
                          TextSpan(text: "Supported file types:",
                          style: TextStyle(
                            color: Pallete.black,
                            fontSize: 12
                          )),
                          TextSpan(text: "PDF/JPG",
                          style: TextStyle(color: Pallete.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold ))
                        ]
                        )
                      )
                            
                          ],
                        )
                      ), ),
                       
                  SizedBox(height: 12,),
                  GestureDetector(
                    onTap: _selectImage,
                    child: Text('Select another image',
                    style: TextStyle(
                      color: Pallete.black
                    ),),
                  ),
                  SizedBox(height: size.height*0.08,),
                  SizedBox(
                      width: size.width*0.7,
                      child: ElevatedButton(
                      
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Pallete.yellow1,
                        elevation: 4
                      ),
                      onPressed: _uploadImage, child: Text('Continue',
                                      style: TextStyle(
                      color: Pallete.black
                                      ),)),
                    ),
                    SizedBox(height: 20,),
                    if (_downloadUrl != null)
                    Text(
                      'Download URL: $_downloadUrl',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  // SizedBox(
                  //   width: size.width*0.07,
                  //   child: ElevatedButton(
                        
                  //       onPressed: _uploadImage,
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: Pallete.yellow1,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(20)
                  //         )
                  //       ),
                  //       child: Text('Continue',
                  //       style: TextStyle(
                  //         color: Pallete.black,
                  //         fontSize: 16
                  //       ),),
                  //     ),
                  // ),
                      ],
                    ),
                  ),
                  
                  
                  
            
                
                  
            
                  // Display the download URL if available
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}





