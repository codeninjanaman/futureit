// import 'package:flutter/material.dart';
// import 'package:futureit/constants.dart';
// import 'package:get/get.dart';

// class RateUsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Pallete.color1,
//       appBar: AppBar(
//         bottom: PreferredSize(
//             preferredSize: Size.fromHeight(1), // Set the height of the white border
//             child: Container(
//               color: Colors.grey, // Color of the white border
//               height: 1, // Thickness of the white border
//             ),
//           ),
//         backgroundColor: Pallete.color1,
//         title: Text('Rate Us',
//         style: TextStyle(
//           color: Colors.white
//         ),),

//         leading: IconButton(onPressed: (){
//           Get.back();
//         }, icon: Icon(Icons.arrow_back,
//         color: Colors.white,))
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 height: 160,
//                 width: double.infinity,
//                 child: Image.asset(
//                   'assets/images/Rating.png', 
//                   width: 100,
//                   height: 100,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'ENJOYING THE APP ?',
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFFB07E35)), 
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Your opinion matters to us',
//                 style: TextStyle(color: Color(0xFFB07E35)),
//               ), // Text color
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   for (int i = 1; i <= 5; i++)
//                     IconButton(
//                       icon: Icon(
//                         i <= 3
//                             ? Icons.star
//                             : Icons
//                                 .star_border, 
//                         color: Color(0xFFB07E35), 
//                       ),
//                       onPressed: () {
                       
//                       },
//                     ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: TextField(
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 13
//                   ),
//                   decoration: InputDecoration(
//                     hintText: 'Write a detailed review...',
//                     border: OutlineInputBorder(),
//                     hintStyle: TextStyle(
//                       color: Colors.white38,
//                       fontSize: 13
//                     )
//                   ),
//                   maxLines: 4,
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
                
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(
//                       Color(0xFFB07E35)),
//                 ),
//                 child: Text(
//                   'Submit',
//                   style:
//                       TextStyle(color: Colors.white), 
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:futureit/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class RateUsScreen extends StatefulWidget {
  @override
  _RateUsScreenState createState() => _RateUsScreenState();
}

class _RateUsScreenState extends State<RateUsScreen> {
  int selectedStars = 0;
  TextEditingController reviewController = TextEditingController();
  final CollectionReference reviewsCollection =
      FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1), // Set the height of the white border
            child: Container(
              color: Colors.grey, // Color of the white border
              height: 1, // Thickness of the white border
            ),
          ),
        backgroundColor: Pallete.white,
        title: Text('Rate Us',
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            color: Pallete.black,
            fontSize: 16,
          )
        ),),

        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,
        color: Pallete.black,))
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/rateus.png'),
              SizedBox(height: size.height*0.04,),
              Text('ENJOYING THE APP?',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: Pallete.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                )
              ),),
              Text('Your opinion matter to us',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: Pallete.yellow1,
                  fontSize: 12,
                  // fontWeight: FontWeight.w600
                )
              ),),
              SizedBox(height: size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                   
                    icon: Icon(
                      index < selectedStars ? Icons.star : Icons.star_border_outlined,
                      color: Pallete.yellow1,
                      size: size.height*0.04,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedStars = index + 1;
                      });
                    },
                  );
                }),
              ),
             SizedBox(height: size.height*0.05,),
              TextField(
                style: GoogleFonts.inter(
                  color: Pallete.black,
                  fontSize: 12
                ),
                controller: reviewController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                  focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 1.0,
                        color: Colors.black)
                      ),
                  hintText: 'Describe your experience',
                  hintStyle: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: Pallete.yellow1,
                      fontSize: 12
                    )
                  )
                ),
                maxLines: 4,
              ),
              SizedBox(height: size.height*0.06),
              SizedBox(
                width: size.width*0.6,
                child: ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Pallete.yellow1,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                  ),
                  onPressed: () {
                    _addReviewToFirestore();
                  },
                  child: Text('Submit',
                  style: GoogleFonts.inter(
                    color: Pallete.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addReviewToFirestore() {
    String reviewText = reviewController.text;
    reviewsCollection.doc(Pallete.documentId).update({
      'stars': selectedStars,
      'review': reviewText,
      'timestamp': FieldValue.serverTimestamp(),
    }).then((value) {
      // Clear the review text field and reset the selected stars
      reviewController.clear();
      setState(() {
        selectedStars = 0;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Review submitted successfully')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit review')),
      );
    });
  }
}
