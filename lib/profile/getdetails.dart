// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:futureit/constants.dart';
// import 'package:google_fonts/google_fonts.dart';
// class getdetails extends StatelessWidget {
//   const getdetails({
//     super.key,
//     required Future<QuerySnapshot<Map<String, dynamic>>>? userDataFuture,
//     required this.detailname,
//   }) : _userDataFuture = userDataFuture;

//   final Future<QuerySnapshot<Map<String, dynamic>>>? _userDataFuture;
//   final String detailname;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
//     future: _userDataFuture,
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return CircularProgressIndicator();
//       } else {
//         if (snapshot.hasError) {
//           // return Text('Error: ${snapshot.error}');
//           return Text('Error rerieving the details');
//         } else {
//           if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
//             var userEmail = snapshot.data!.docs.first.data()[detailname];
//             if(userEmail !=null){
//               return Text(userEmail,
//             style: GoogleFonts.inter(
//               textStyle: TextStyle(
//                 fontSize: 14,
//                 color: Pallete.black
//               )
//             ),);
//             }
            
//           } else {
//             return Text('No user found with the provided email.');
//           }
//         }
//       }
      
//     },
//       )
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class getdetails extends StatelessWidget {
  const getdetails({
    Key? key,
    required Future<QuerySnapshot<Map<String, dynamic>>>? userDataFuture,
    required this.detailname,
  })   : _userDataFuture = userDataFuture,
        super(key: key);

  final Future<QuerySnapshot<Map<String, dynamic>>>? _userDataFuture;
  final String detailname;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: _userDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error retrieving the details');
          } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            var userEmail = snapshot.data!.docs.first.data()[detailname];
            if (userEmail != null) {
              return Text(
                userEmail.toString(),
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: Pallete.black,
                  ),
                ),
              );
            } else {
              return Text('User email is null.');
            }
          }
          return Text('No user found with the provided email.');
        },
      ),
    );
  }
}
