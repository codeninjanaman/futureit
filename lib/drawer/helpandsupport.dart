import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpAndSupportPage extends StatelessWidget {
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
        title: Text('Help and Support',
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
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions',
              style: GoogleFonts.inter(
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
              ),
            ),
            SizedBox(height: size.height*0.02,),
            FAQItem(
              question: 'How do I reset my password?',
              answer: 'To reset your password, go to our website and click on the "Forgot Password" link.',
            ),
            FAQItem(
              question: 'What are our business hours?',
              answer: 'Our business hours are from 9:00 AM to 5:00 PM, Monday to Friday.',
            ),
            FAQItem(
              question: 'How can I contact customer support?',
              answer: 'You can contact our customer support by email or phone.',
            ),
          
            SizedBox(height: size.height*0.02,),
            Text(
              'Contact Information',
              style: GoogleFonts.inter(
                textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)
              ),
            ),
            SizedBox(height: size.height*0.02,),
            Container(
              decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            color: Pallete.yellow1,
          //  shape: RoundedRectangleBorder()
          ),
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text('Email Customer Support',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 14
                  )
                ),),
                subtitle: Text('finnitapp@gmail.com',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 12
                  )
                ),),
                onTap: () {
                  launch('mailto:finnitapp@gmail.com');
                },
              ),
            ),
            SizedBox(height: size.height*0.02,),
            Container(
              decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            color: Pallete.yellow1,
          //  shape: RoundedRectangleBorder()
          ),
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text('Toll-Free Number',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 14
                  )
                ),),
                subtitle: Text('+91 8627811214',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 12
                  )
                ),),
                onTap: () {
                  launch('tel:+91 8627811214');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10),
          height: size.height*0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            color: Color(0xFFD9D9D9),
          //  shape: RoundedRectangleBorder()
          ),
          
          child: Center(
            child: ListTile(
              title: Text(widget.question,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontSize: 12
                )
              ),),
              trailing: Icon(expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },
            ),
          ),
        ),
        SizedBox(height: 10,),
        if (expanded)
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(

              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.all(Radius.circular(13))
              
            ),
            child: Text(widget.answer,
             style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 12
              )
            )),
          ),
        
        Divider(),
      ],
    );
  }
}