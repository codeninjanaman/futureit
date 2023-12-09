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
import 'dart:core';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  DateTime ?loginTime;
  
  int _selectedIndex = 0;
  static const TextStyle _selectedLabelStyle = TextStyle(color: Colors.orange,
  fontSize: 8);
  static const TextStyle _unselectedLabelStyle = TextStyle(color: Colors.white,
  fontSize: 8);
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
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
  final List<String> _titles = [
    'DashBoard',
    'Watchlist',
    'Position',
    'Order Book',
    'Analytics'
  ];
  final List<Widget> _screens = [
    homepage(),
    watchlist(),
    portfolio(),
    orderbook(),
    analytics()
  
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    

    final height= MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
       backgroundColor: Pallete.white,

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
              // Profilemenuwidget(title: 'Market', icon: Icons.bar_chart, onPress: (){}),
              Profilemenuwidget(title: 'Trade', icon: Icons.track_changes, onPress: (){}),
              Profilemenuwidget(title: 'Portfolio', icon: Icons.book, onPress: (){}),
              Profilemenuwidget(title: 'Fund Transfer', icon: Icons.money, onPress: (){}),
              Profilemenuwidget(title: 'News', icon: Icons.newspaper, onPress: (){}),
              Profilemenuwidget(title: 'Analytics', icon: Icons.pie_chart, onPress: (){}),
              Profilemenuwidget(title: 'Profit Calculator', icon: Icons.calculate, onPress: (){}),
              Profilemenuwidget(title: 'Help & Support', icon: Icons.help, onPress: (){}),
              Profilemenuwidget(title: 'About Us', icon: Icons.error_outline, onPress: (){}),
              Profilemenuwidget(title: 'Refer a Friend', icon: Icons.countertops_outlined, onPress: (){}),
              Profilemenuwidget(title: 'Rate Us', icon: Icons.star_border_outlined, onPress: (){}),

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
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.transparent,
        child: ClipRRect(
          
          borderRadius: BorderRadius.circular(25),
          child: BottomNavigationBar(
            
            // fixedColor: Colors.black,
            backgroundColor: Pallete.black1,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.orange : Colors.white),
                label: 'Home',
                activeIcon: Icon(Icons.home, color: Colors.orange),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.watch_later, color: _selectedIndex == 1 ? Colors.orange : Colors.white),
                label: 'Watchlist',
                activeIcon: Icon(Icons.watch_later, color: Colors.orange),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt, color: _selectedIndex == 2 ? Colors.orange : Colors.white),
                label: 'Portfolio',
                activeIcon: Icon(Icons.list_alt, color: Colors.orange),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined, color: _selectedIndex == 3 ? Colors.orange : Colors.white),
                label: 'Order Book',
                activeIcon: Icon(Icons.book_outlined, color: Colors.orange),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart, color: _selectedIndex == 4 ? Colors.orange : Colors.white),
                label: 'Analytics',
                activeIcon: Icon(Icons.pie_chart, color: Colors.orange),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.white,
            selectedLabelStyle: _selectedLabelStyle,
            unselectedLabelStyle: _unselectedLabelStyle,
            onTap: _onItemTapped,
          ),
        ),
      ),
      // 
     
    );
  }
}
