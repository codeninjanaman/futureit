import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:futureit/Dashboard/position/position.dart';
import 'package:image_picker/image_picker.dart';

class AadhaarUploadScreen extends StatefulWidget {
  @override
  _AadhaarUploadScreenState createState() => _AadhaarUploadScreenState();
}

class _AadhaarUploadScreenState extends State<AadhaarUploadScreen> {
  File? _selectedImage;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _uploadAadhaarImage() async {
    final user = _auth.currentUser;
    if (user != null && _selectedImage != null) {
      final userId = user.uid;
      final reference =
          FirebaseStorage.instance.ref().child('aadhaar_images/$userId.jpg');
      await reference.putFile(_selectedImage!);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aadhaar image uploaded successfully!')),
      );
      Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AadhaarRetrieveScreen(),
                    ),
                  );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an image')),
      );
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    setState(() {
      _selectedImage = File(pickedImage.path);
    });
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('No image selected')),
    );
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Aadhaar Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _selectedImage != null
                ? Image.file(_selectedImage!,
                height: 200,
                width: 200,)
                : Text('No image selected'),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Select Aadhaar Image'),
            ),
            ElevatedButton(
              onPressed: _uploadAadhaarImage,
              child: Text('Upload Aadhaar Image'),
            ),
          ],
        ),
      ),
    );
  }
}
