// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class VerifyScreen extends StatefulWidget {
//   @override
//   _VerifyScreenState createState() => _VerifyScreenState();
// }

// class _VerifyScreenState extends State<VerifyScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   late TextEditingController _emailController;
//   bool _isEmailVerified = false;

//   @override
//   void initState() {
//     _emailController = TextEditingController();
//     super.initState();
//   }

//   Future<void> sendVerificationEmail() async {
//     try {
//       String email = _emailController.text.trim(); // Get the entered email
//       if (email.isNotEmpty && RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(email)) {
//         User? user = _auth.currentUser;
//         if (user != null) {
//           await user.updateEmail(email); // Update user email
//           await user.sendEmailVerification();
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Please enter a valid email address'),
//           ),
//         );
//       }
//     } catch (e) {
//       print("Error sending verification email: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Email Verification'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextFormField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 suffixIcon: _isEmailVerified
//                     ? Icon(Icons.check, color: Colors.green)
//                     : Icon(Icons.check, color: Colors.grey),
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty || !RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(value)) {
//                   return 'Please enter a valid email';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 await sendVerificationEmail();
//               },
//               child: Text('Verify'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyScreen extends StatefulWidget {
  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  bool _isEmailValid = false;

  Future<void> _sendVerificationEmail(BuildContext context) async {
    try {
      if (_isEmailValid) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: 'dummyPassword', // Firebase requires a password to create an account
        );
        // Send email verification
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null && !user.emailVerified) {
          await user.sendEmailVerification();
          // Navigate to the next screen
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => NextScreen()),
          // );
        }
      } else {
        // Handle invalid email scenario
        print('Please enter a valid email address.');
      }
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Exception: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                ),
                validator: (value) {
                  if (value!.isEmpty || !value!.contains('@')) {
                    setState(() {
                      _isEmailValid = false;
                    });
                    return 'Enter a valid email';
                  }
                  setState(() {
                    _isEmailValid = true;
                  });
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _sendVerificationEmail(context);
                  }
                },
                child: Text('Verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Screen'),
      ),
      body: Center(
        child: Text('Email verified. Welcome to the next screen!'),
      ),
    );
  }
}
