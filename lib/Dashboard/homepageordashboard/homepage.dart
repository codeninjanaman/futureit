import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:futureit/Dashboard/analytics/analytics.dart';
import 'package:futureit/Dashboard/homepageordashboard/aboutus.dart';
import 'package:futureit/Dashboard/homepageordashboard/nsebse.dart';
import 'package:futureit/Dashboard/homepageordashboard/viewholdings.dart';
import 'package:futureit/Dashboard/order%20book/orderwidgets.dart';
import 'package:futureit/Dashboard/portfolio/portfolio.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/controller/profilecontroller.dart';
import 'package:futureit/drawer/helpandsupport.dart';
import 'package:futureit/drawer/profit_calculator.dart';
import 'package:futureit/drawer/rateus.dart';
import 'package:futureit/drawer/referafriend.dart';
import 'package:futureit/news/new_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../authentication/models/user_model.dart';
import '../../authentication_repositary/authentication_repositary.dart';
import '../../profile/profile_screen.dart';
import '../../profile/profilemenuwidget.dart';
import '../order book/order.dart';
import 'package:googleapis/people/v1.dart' as people;
import 'package:googleapis_auth/googleapis_auth.dart' as auth;

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  DateTime ?loginTime;
  
//   Future<Map<String, String>?> _getUserInfo() async {
//   try {
//     final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
//     if (googleSignInAccount == null) return null;

//     final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;

//     final authHeaders = {
//       'Authorization': 'Bearer ${googleSignInAuthentication.accessToken}',
//     };

//     final peopleService = people.PeopleServiceApi()..httpClient.readCredentialsFromHeaders(authHeaders);

//     final people.Person me = await peopleService.people.get('people/me');

//     final String name = me.names?.first.displayName ?? '';
//     final String email = me.emailAddresses?.first.value ?? '';

//     return {'name': name, 'email': email};
//   } catch (e) {
//     print("Error getting user's info: $e");
//     return null;
//   }
// }


//   void getTime() async{
//     SharedPreferences prefs = await SharedPreferences.getInstance();
// String? loginTimeString = prefs.getString('loginTime');
// setState(() {
//   loginTime = DateTime.parse(loginTimeString);
// });
// // Now you have the login time, and you can use it as needed.

//   }
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getTime();
//   }


  final controller = Get.put(ProfileController());

  int _selectedTabIndex = 0; // Index of the selected tab

  // Define the content widgets for 'Order' and 'Position' tabs
  final List<Widget> _tabContents = [
    Text('Order'),
    Text('Position'),
  ];
  @override
  Widget build(BuildContext context) {
    CollectionReference users =  FirebaseFirestore.instance.collection('Users');
    Size size = MediaQuery.of(context).size;
    final height= MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.orange),
            
              backgroundColor: Pallete.white,
              title: Align(
                alignment: Alignment.center,
                child: Text('Dashboard',
                style: TextStyle(
                  color: Pallete.black1,
                  fontSize: 15
                ),),
              ),
              actions: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.transparent
        
                  ),
                  child: IconButton(onPressed: (){
                    Get.to(()=>ProfileScreen());
                  }, icon: Icon(Icons.person,
                  color: Pallete.yellow1)),
                )
              ],
            ),
            drawer: Drawer(
              backgroundColor: Pallete.white,
              // backgroundColor: const Color.fromARGB(255, 16, 16, 16),
              child: 
              Column(
               
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: height*0.015,),
                  Container(
                    color: Pallete.black1,
                    child: Stack(children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image(image: AssetImage('assets/images/drawer.png'),
                        height: size.height*0.12,)),
                      Container(
                      padding: EdgeInsets.only(left: 20,right: 20,top: 10),
                      height: height*0.14,
                      decoration: BoxDecoration(
                        // color: Pallete.black1
                      ),
                     
                      child: Column(
                        children: [
                          SizedBox(height: height*0.015,),
                          
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              
                              Text("Welcome, ",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                )
                              ),),
                              FutureBuilder(
                      future: controller.getUserData(),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.done){
                          if(snapshot.hasData){
                            UserModel user = snapshot.data as UserModel;
                            return Text(user.fullName.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              
                            ),);
                            
                          }
                        }
                        return Text("Loading");
                      
                      })
                            ],
                          ),
                          SizedBox(height: size.height*0.001,),
                      
                          Row(
                            children: [
                              Text("Login Id: ",
                              style: GoogleFonts.inter(
                                color: Pallete.white,
                                fontSize: 12,
                              ),),
                              FutureBuilder(
                      future: controller.getUserData(),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.done){
                          if(snapshot.hasData){
                            UserModel user = snapshot.data as UserModel;
                            return Text(user.email.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              
                            ),);
                            
                          }
                        }
                        return Text("Loading");
                      
                      })
                              //                 FutureBuilder <DocumentSnapshot>(
                              //     future: users.doc(Pallete.documentId).get(),
                              //     builder: (context, snapshot) {
                              //       if(snapshot.connectionState == ConnectionState.done){
                              // Map<String, dynamic> data = snapshot.data!.data() as Map<String , dynamic>;
                              // return Text(data['Email'], 
                              // style: GoogleFonts.inter(
                              //   textStyle: TextStyle(
                              //     color: Pallete.white,
                              //     fontSize: 12
                              //   )
                              // ),);
                              //       }
                              //       return const Text('');
                              //     },
                              //   ),
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     Text('Login Time : ',
                          //     style: TextStyle(color: Colors.white,
                          //     fontSize: 15,
                          //     fontWeight: FontWeight.bold),),
                              
                              
                          //     Flexible(
                          //       child: Text('$loginTime',
                          //       overflow: TextOverflow.ellipsis,
                          //       style: TextStyle(color: Colors.white,
                          //       fontSize: 15)),
                          //     )
                              
                          //   ],
                          // )
                          
                        ],
                      ),
                    ),
                    ],),
                  ),
                  
                  
                SizedBox(height: height*0.01,),
                // Profilemenuwidget(title: 'Market', icon: Icons.bar_chart, onPress: (){}),
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Profilemenuwidget(title: 'Trade', icon: Icons.track_changes, onPress: (){}),
                Profilemenuwidget(title: 'Portfolio', icon: Icons.book, onPress: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => portfolio(),
                      ),
                    );
                }),
                // Profilemenuwidget(title: 'Fund Transfer', icon: Icons.money, onPress: (){}),
                // Profilemenuwidget(title: 'News', icon: Icons.newspaper, onPress: (){}),
                Profilemenuwidget(title: 'Analytics', icon: Icons.pie_chart, onPress: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => analytics(),
                      ),
                    );
                }),
                Profilemenuwidget(title: 'News', icon: Icons.newspaper, onPress: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsPage(),
                      ),
                    );
                }),
                Profilemenuwidget(title: 'Profit Calculator', icon: Icons.calculate, onPress: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalculatorApp(),
                      ),
                    );
                }),
                Profilemenuwidget(title: 'Help', icon: Icons.help, onPress: (){
                  Get.to(HelpAndSupportPage());
                }),
                Profilemenuwidget(title: 'About Us', icon: Icons.person, onPress: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => aboutus(),
                      ),
                    );
                }),
                Profilemenuwidget(title: 'Refer a Friend', icon: Icons.countertops_outlined, onPress: (){
                  Get.to(ReferFriendScreen());
                }),
                Profilemenuwidget(title: 'Rate Us', icon: Icons.star_border_outlined, onPress: (){
    
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RateUsScreen(),
                      ),
                    );
                }),
    
                Container(
                  height: height*0.1,
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton(onPressed: (){
                    AuthenticationRepositary.instance.logout();
                  }, child: Text('LOGOUT',
                  style: TextStyle(
                    color: Colors.white,
                
                  ),),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                    backgroundColor: Colors.red
                  ),),
                )
                      ],
                    ),
                  ),
                )
                
                ],
              ),
              
            ),
        backgroundColor: Pallete.white,
        body: SingleChildScrollView(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height*0.01,),
              
              Container(
                padding: EdgeInsets.only(top: 1,left: 20,right: 20,),
                  
                  // height: 100,
                  width: double.infinity,
                  child: nsebse(size: size),
                ),
                
                Container(
                  // padding: EdgeInsets.only(left: 20,right: 20),
                  child: Column(
          children: [
            // Tab row
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // 'Order' tab
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTabIndex = 0;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _selectedTabIndex == 0 ? Pallete.color2 : Colors.transparent,
                            width: 2.0,
                          ),
                        ),
                      ),
                      child: Text('Order',
                      style: GoogleFonts.inter(
                         textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        color: Pallete.black
                      ),
                      )
                      )
                    ),
                  ),
                  SizedBox(width: 20,),
    
                  // 'Position' tab
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTabIndex = 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _selectedTabIndex == 1 ? Pallete.color2 : Colors.transparent,
                            width: 2.0,
                            
                          ),
                        ),
                      ),
                      child: Text('Position',
                      style: GoogleFonts.inter(
                         textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        color: Pallete.black
                      ),
                      )
                      )
                    ),
                  ),
                ],
              ),
            ),
    
            // Content area
            Visibility(
              visible: _selectedTabIndex == 0, // Show Container when 'Order' tab is selected
              child:
               orderwidget(height: height, width: width),
            ),
    
            Visibility(
              visible: _selectedTabIndex == 1, // Show Container when 'Position' tab is selected
              child: Container(
                
                color: Colors.transparent, // Change the color as needed
                child: Container(
                  padding: EdgeInsets.only(top: 7,right: 12,left: 12),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        orderwidgets(height: height, width: width, title: '0', subtitle: 'Open Order'),
                        orderwidgets(height: height, width: width, title: '0', subtitle: 'Closed Order'),
                        orderwidgets(height: height, width: width, title: '₹0.00', subtitle: 'Booked P/L'),
                        orderwidgets(height: height, width: width, title: '0.00', subtitle: 'Available Limit'),
                        orderwidgets(height: height, width: width, title: '₹0.00', subtitle: 'Holding Value'),
                      ],
                    ),
                  ),
                )
            ),
            )
          ],
        ),
                ),
    
                SizedBox(height: size.height*0.04,),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text('View Holding >',
                          style: GoogleFonts.inter(
                             textStyle: TextStyle(
                              fontSize: 12,
                            color: Colors.grey.shade700
                          ),
                          )
                          ),
                  ),
                ),
                SizedBox(height: size.height*0.025,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  height: size.height*1,
                  decoration: BoxDecoration(
                    color: Pallete.yellow1,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Trading Calls',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Pallete.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500 
                        )
                      ),),
                      SizedBox(height: size.height*0.01,),
    
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Stocks',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Pallete.black,
                              fontSize: 12
                            )
                          ),),
                          Text('SL',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Pallete.black,
                              fontSize: 12
                            )
                          ),),
                          Text('TGT',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Pallete.black,
                              fontSize: 12
                            )
                          ),),
                          Text('Time',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Pallete.black,
                              fontSize: 12
                            )
                          ),),
                          Text('Status',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Pallete.black,
                              fontSize: 12
                            )
                          ),),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Container(
                        height: 0.7,
                        width: double.infinity,
                        color: Pallete.black,
    
                      ),
                      SizedBox(height: size.height*0.02,),
                      Align(
                        alignment: Alignment.center,
                        child: Text('No Trading Calls!',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Pallete.black,
                                fontSize: 12
                              )
                            ),),
                      ),
                      
                    ],
                  ) ,
                )
    
                
            ],
          )
        ),
      ),
    );
  }
}



