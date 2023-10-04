import 'package:flutter/material.dart';
import 'package:futureit/authentication_repositary/authentication_repositary.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/signup.dart/signupscreen.dart';

class loginfooter extends StatelessWidget {
  const loginfooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("OR",
        style: TextStyle(
          color: Colors.white
        ),),
        SizedBox(height: 20,),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: OutlinedButton.icon(
            style: ButtonStyle(
                            // shape: BeveledRectangleBorder(),
            side: MaterialStateProperty.all(
              BorderSide(
                color: Colors.white, // Set the desired border color here
                width: 1.0,
                 // Set the desired border width here
              ),
            ),
          ),
            onPressed: (){
              AuthenticationRepositary.instance.signInWithGoogle();
            },
          icon: Image(image: AssetImage('assets/images/five.png'),
          width: 20,), label: Text("Sign-In with Google",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14
          ),)),
        ),
        SizedBox(height: 5,),
        TextButton(onPressed: (){
          Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => signupscreen(),
      ),
    );
        }, 
        child: Text.rich(
          TextSpan(
          text: "Don't have an Account? ",
          style: TextStyle(color: Colors.white,
          fontSize: 14),
          children: [
            TextSpan(
              text: "Signup",
              style: TextStyle(
                color: Pallete.color1,
                fontSize: 14
              )
            )
          ]
        )))
      ],
    );
  }
}