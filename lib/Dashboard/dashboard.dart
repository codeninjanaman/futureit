// import 'package:flutter/material.dart';
// import 'package:futureit/authentication_repositary/authentication_repositary.dart';
// import 'package:futureit/profile/profile_screen.dart';

// class Dashboard extends StatelessWidget {
//   const Dashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 250,),
//             Text("Dashboard"),
//             ElevatedButton(onPressed: (){
//               AuthenticationRepositary.instance.logout();
//             }, child: Text("logout")),

//             ElevatedButton(onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
//             }, child: Text("Profile")),

//           ],
//         ),
        
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:futureit/Dashboard/analytics/analytics.dart';
import 'package:futureit/Dashboard/homepageordashboard/homepage.dart';
import 'package:futureit/Dashboard/order%20book/orderbook.dart';
import 'package:futureit/Dashboard/portfolio/portfolio.dart';
import 'package:futureit/Dashboard/watchlist/watchlist.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/profile/profilemenuwidget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../authentication/models/user_model.dart';
import '../authentication_repositary/authentication_repositary.dart';
import '../controller/profilecontroller.dart';
import '../profile/profile_screen.dart';
import 'dart:core';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  DateTime ?loginTime;
  
  

  void getTime() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
String? loginTimeString = prefs.getString('loginTime');
if (loginTimeString != null) {
  setState(() {
    loginTime = DateTime.parse(loginTimeString);
  });
  // Now you have the login time, and you can use it as needed.
}

  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTime();
  }


  final controller = Get.put(ProfileController());
  int _selectedIndex = 0;
  final List<String> _titles = [
    'DashBoard',
    'Watchlist',
    'Position',
    'Order Book',
    'Analytics'
  ];
  final List _tabs = [
    homepage(),
    watchlist(),
    portfolio(),
    orderbook(),
    analytics()
  
  ];

  @override
  Widget build(BuildContext context) {
    

    final height= MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
       backgroundColor: Pallete.color1,
      // appBar: AppBar(
      //   bottom: PreferredSize(
      //     preferredSize: Size.fromHeight(1), // Set the height of the white border
      //     child: Container(
      //       color: Colors.grey, // Color of the white border
      //       height: 1, // Thickness of the white border
      //     ),
      //   ),
      //     iconTheme: IconThemeData(color: Colors.white),
      //     backgroundColor: Colors.transparent,
      //     // leading: IconButton(
      //     //   icon: Icon(Icons.menu,),
      //     //   onPressed: (){
      //     //     Drawer()
      //     //   },

      //     // color: Colors.white,),

      //     title: SizedBox( 
      //       height: 40,
      //       child: TextFormField(
      //         style: TextStyle(color: Colors.white),
              
      //         decoration: const InputDecoration(
      //           contentPadding: EdgeInsets.only(bottom: 2),
      //           label: Text("Search",
      //           style: TextStyle(fontSize: 15,
      //           color: Colors.white),),
      //           prefixIcon: Icon(Icons.search,
      //           color: Colors.white,),
      //           border: OutlineInputBorder(),
      //           focusedBorder: OutlineInputBorder(
      //             borderSide: BorderSide(width: 1.1,
      //                 color:Colors.white)
      //           ),
      //           labelStyle: TextStyle(color: Colors.white),
      //           // focusedBorder: OutlineInputBorder(
      //           //   borderSide: BorderSide(width: 2.0,
      //           //   color:Color.fromARGB(221, 44, 42, 42))
      //           // )
                
      //         )
      //       ),
      //     ),
      //     actions: [
      //       Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(100),
      //           color: Colors.transparent

      //         ),
      //         child: IconButton(onPressed: (){
      //           Get.to(()=>ProfileScreen());
      //         }, icon: Icon(Icons.person,
      //         color: Colors.white,)),
      //       )

      //     ],
      //   ),
        drawer: SafeArea(
          child: Drawer(
            backgroundColor: const Color.fromARGB(255, 16, 16, 16),
            child: 
            Column(
             
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: height*0.015,),
                Container(
                  padding: EdgeInsets.all(20),
                  height: height*0.17,
                  decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFD69A38),
                Color(0xFF110C2C),
                
              ],
              stops: [0.2,0.9]
            )
          ),
                  child: Column(
                    children: [
                      SizedBox(height: height*0.015,),
                      Row(
                        children: [
                          Text("Name : ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
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
                          fontSize: 15,
                          
                        ),);
                        
                      }
                    }
                    return Text("Loading");
                  
                  })
                        ],
                      ),

                      Row(
                        children: [
                          Text("Email : ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
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
                          fontSize: 15,
                          
                        ),);
                        
                      }
                    }
                    return Text("Loading");
                  
                  })
                        ],
                      ),
                      Row(
                        children: [
                          Text('Login Time : ',
                          style: TextStyle(color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),),
                          
                          
                          Flexible(
                            child: Text('$loginTime',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white,
                            fontSize: 15)),
                          )
                          
                        ],
                      )
                      
                    ],
                  ),
                ),
                
              SizedBox(height: height*0.01,),
              Profilemenuwidget(title: 'Market', icon: Icons.bar_chart, onPress: (){}),
              Profilemenuwidget(title: 'Trade', icon: Icons.track_changes, onPress: (){}),
              Profilemenuwidget(title: 'Portfolio', icon: Icons.book, onPress: (){}),
              Profilemenuwidget(title: 'Fund Transfer', icon: Icons.money, onPress: (){}),
              Profilemenuwidget(title: 'News', icon: Icons.newspaper, onPress: (){}),
              Profilemenuwidget(title: 'Analytics', icon: Icons.pie_chart, onPress: (){}),
              Profilemenuwidget(title: 'Help', icon: Icons.help, onPress: (){}),

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
        ),
      // appBar: AppBar(title: Text(_titles[_selectedIndex])),
      body: _tabs[_selectedIndex],
      bottomNavigationBar: Material(
        elevation: 60,
        child: Container(
          // decoration: BoxDecoration(
          // border: Border.all(color: Colors.black)
          // ),
          // color: Color(0xFF6361EC),
          
          color: Pallete.color2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
            child: GNav(
                onTabChange: (newIndex) =>
                    setState(() => _selectedIndex = newIndex),
                backgroundColor: Pallete.color2,
                // backgroundColor: Colors.white,
                color: Colors.white,
                activeColor: Colors.white,
                // tabBackgroundColor: Colors.blue.shade700,
                tabBackgroundColor: Colors.white,
                gap: 7,
                padding: const EdgeInsets.all(8),
                tabs: const [
                  GButton(
                    icon: LineAwesomeIcons.home,
                    iconColor: Colors.white,
                    iconActiveColor: Colors.black,
                    text: ('Dashboard'),
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  GButton(
                    icon: Icons.note_add_sharp,
                    iconColor: Colors.white,
                    iconActiveColor: Colors.black,
                    text: ('Watchlist'),
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  GButton(
                    icon: Icons.post_add_outlined,
                    iconColor: Colors.white,
                    iconActiveColor: Colors.black,
                    text: ('Position'),
                    // hoverColor: Colors.grey,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  GButton(
                    icon: Icons.book,
                    iconColor: Colors.white,
                    iconActiveColor: Colors.black,
                    text: ('Order Book'),
                    // hoverColor: Colors.grey,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  GButton(
                    icon: Icons.pie_chart,
                    iconColor: Colors.white,
                    iconActiveColor: Colors.black,
                    text: ('Analytics'),
                    // hoverColor: Colors.grey,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                
                ]),
          ),
        ),
      ),
    );
  }
}
