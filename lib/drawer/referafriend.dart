import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futureit/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

class ReferFriendScreen extends StatefulWidget {
  @override
  _ReferFriendScreenState createState() => _ReferFriendScreenState();
}

class _ReferFriendScreenState extends State<ReferFriendScreen> {
  final String referralCode = 'Jatin123';

  
  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: referralCode));
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied to Clipboard'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
        backgroundColor: Pallete.yellow1,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
      
          },
          textColor: Colors.white,
        ),
      ),
    );
  }


  void shareReferralCode() {
    copyToClipboard(); 


    Share.share('Use my referral code: $referralCode');
  }

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
        title: Text('Refer A Friend',
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
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Image.asset('assets/images/refer.png',
                  height: size.height*0.23,),
                ),
                SizedBox(height: size.height*0.03),
                Text(
                  'Earn Money By Refer',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)
                  ),
                  
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                      width: size.width*0.6,
                      height: size.height*0.06,
                      decoration: BoxDecoration(
                        color: Colors.white, 
                        border: Border.all(
                          color: Pallete.yellow1, 
                          style: BorderStyle.solid, 
                          width: 2.0, 
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.all(14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            referralCode,
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0), fontSize: 14), 
                          ),
                          IconButton(
                            padding: EdgeInsets.all(0),
                                icon: Icon(Icons.content_copy,
                                size: 20,),
                                color: Color.fromARGB(255, 0, 0, 0), 
                                tooltip: 'Copy Referral Code',
                                onPressed: copyToClipboard,
                              ),
                          
                        ],
                        
                      ),
                      
                    ),
                    // Container(
                    //   child: Text(
                    //         '                                    Copy your code, share it with your friends**',
                    //         style: TextStyle(fontSize: 8, color: Colors.grey),
                    //       ),
                    // ),
                      ],
                    ),
                    SizedBox(width: size.width*0.03,),
                    SizedBox(
                      width: size.width*0.25,
                      height: size.height*0.06,
                      child: ElevatedButton(
                                      onPressed: shareReferralCode,
                                      child: Text('Share', style: TextStyle(color: Colors.white)),
                                      style: ElevatedButton.styleFrom(
                      primary: Pallete.black1, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                                      ),
                                    ),
                    ),
                  ],
                ),
                
                SizedBox(height: 20),
                
              ],
            ),
        ),
        
      ),
    );
  }
}