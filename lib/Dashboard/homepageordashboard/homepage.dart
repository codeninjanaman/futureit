import 'package:flutter/material.dart';
import 'package:futureit/Dashboard/analytics/analytics.dart';
import 'package:futureit/Dashboard/homepageordashboard/aboutus.dart';
import 'package:futureit/Dashboard/homepageordashboard/viewholdings.dart';
import 'package:futureit/Dashboard/portfolio/portfolio.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/controller/profilecontroller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../authentication/models/user_model.dart';
import '../../authentication_repositary/authentication_repositary.dart';
import '../../profile/profile_screen.dart';
import '../../profile/profilemenuwidget.dart';
import 'order.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

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

  int _selectedTabIndex = 0; // Index of the selected tab

  // Define the content widgets for 'Order' and 'Position' tabs
  final List<Widget> _tabContents = [
    Text('Order'),
    Text('Position'),
  ];
  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1), // Set the height of the white border
            child: Container(
              color: Colors.grey, // Color of the white border
              height: 1, // Thickness of the white border
            ),
          ),
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            // leading: IconButton(
            //   icon: Icon(Icons.menu,),
            //   onPressed: (){
            //     Drawer()
            //   },
      
            // color: Colors.white,),
      
            title: SizedBox( 
              height: 40,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 2),
                  label: Text("Search",
                  style: TextStyle(fontSize: 15,
                  color: Colors.white),),
                  prefixIcon: Icon(Icons.search,
                  color: Colors.white,),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.1,
                        color:Colors.white)
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(width: 2.0,
                  //   color:Color.fromARGB(221, 44, 42, 42))
                  // )
                  
                )
              ),
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
                color: Colors.white,)),
              )
      
            ],
          ),
          drawer: Drawer(
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
              Profilemenuwidget(title: 'Portfolio', icon: Icons.book, onPress: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => portfolio(),
                    ),
                  );
              }),
              Profilemenuwidget(title: 'Fund Transfer', icon: Icons.money, onPress: (){}),
              Profilemenuwidget(title: 'News', icon: Icons.newspaper, onPress: (){}),
              Profilemenuwidget(title: 'Analytics', icon: Icons.pie_chart, onPress: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => analytics(),
                    ),
                  );
              }),
              Profilemenuwidget(title: 'Help', icon: Icons.help, onPress: (){}),
              Profilemenuwidget(title: 'About Us', icon: Icons.person, onPress: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => aboutus(),
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
      backgroundColor: Pallete.color1,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Container(
              padding: EdgeInsets.only(top: 1,left: 20,right: 20,),
                color: Color(0xFFFFFFFF).withOpacity(0.7),
                height: 100,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      
                            width: 155,
                            height: 60,
                            padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                             gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFD69A38),
                Color(0xFF110C2C),
                
              ],
              stops: [0.2,0.9]
            ),
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(
                            //   width: 1,
                            //   color: Colors.white
                            // ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("NIFTY 50",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text('19,310.15',
                                  
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                  ),)
                                  ,
                                  Text(' -55.10 (0.28%)',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    
                                    color: Colors.red,
                                    fontSize: 12
                                  ),)
                                ],
                              )
                            ],
                          )
                          ),
                     SizedBox(width: 10,),
                     Container(
                            width: 155,
                            height: 60,
                            padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("BANK NIFTY",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text('43,851.05',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12
                                  ),)
                                  ,
                                  Text(' -40.30 (0.09%)',
                                  
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    
                                  ),)
                                ],
                              )
                            ],
                          )
                          ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                color: Color(0xFFFFFFFF).withOpacity(0.7),
                height: 80,
                child: Row(
                  children: [
                    Container(
                            width: 156,
                            height: 60,
                            padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("SENSEX",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text('64,948.66',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12
                                  ),)
                                  ,
                                  Text(' -22.36 (0.31%)',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12
                                  ),)
                                ],
                              )
                            ],
                          )
                          ),
                    SizedBox(width: 10,),
                    Container(
                            width: 153,
                            height: 60,
                            padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("USDINR",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12
                              ),),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text('83.12',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12
                                  ),)
                                  ,
                                  Text(' +0.01(0.01%)',
                                  
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 12
                                  ),)
                                ],
                              )
                            ],
                          )
                          ),
                  
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
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
                    child: Text(
                      'Order',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
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
                    child: Text(
                      'Position',

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
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
                child: Column(
                  children: [
                    SizedBox(height: height*0.015,),
                    Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [

             Column(
               children: [
                 Container(
               
             height: MediaQuery.of(context).size.height*0.06,
             width: width*0.13,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.transparent,
                border: Border.all(
                 color: Colors.white70,
                 width: 1
                )
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text('0',
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 20
               ),),
                 ],
               )
             ),
             SizedBox(height: 5,),
             Text('Open',
             style: TextStyle(
               color: Colors.white,
               fontSize: 13
             ),)
               ],
             ),


             Column(
               children: [
                 Container(
               
             height: MediaQuery.of(context).size.height*0.06,
             width: width*0.13,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.transparent,
                border: Border.all(
                 color: Colors.white70,
                 width: 1
                )
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text('0',
               style: TextStyle(
                 color: Colors.green,
                 fontSize: 20
               ),),
                 ],
               )
             ),
             SizedBox(height: 5,),
             Text('Long',
             style: TextStyle(
               color: Colors.white,
               fontSize: 13
             ),)
               ],
             ),
             Column(
               children: [
                 Container(
               
            height: MediaQuery.of(context).size.height*0.06,
             width: width*0.13,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.transparent,
                border: Border.all(
                 color: Colors.white70,
                 width: 1
                )
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text('0',
               style: TextStyle(
                 color: Colors.red,
                 fontSize: 20
               ),),
                 ],
               )
             ),
             SizedBox(height: 5,),
             Text('Short',
             style: TextStyle(
               color: Colors.white,
               fontSize: 13
             ),)
               ],
             ),
             Column(
               children: [
                 Container(
               
             height: MediaQuery.of(context).size.height*0.06,
             width: width*0.13,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.transparent,
                border: Border.all(
                 color: Colors.white70,
                 width: 1
                )
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text('0',
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 20
               ),),
                 ],
               ),
             ),
             SizedBox(height: 5,),
             Text('Closed',
             style: TextStyle(
               color: Colors.white,
               fontSize: 13
             ),)
               ],
             ),
           ],
         ),
                 SizedBox(height: height*0.035,),
                  viewholdings(height: height, width: width),

                  
                  
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
              ),

              Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Trading Calls',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),),

                  SizedBox(height: height*0.01,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Stocks',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.8)
                      ),),

                      Text('SL',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.8)
                      ),),

                      Text('TGT',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.8)
                      ),),

                      Text('Time',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.8)
                      ),),

                      Text('Status',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.8)
                      ),),
                    ],
                  )
                  ,
                  SizedBox(height: 3,),
                  Container(
                    height: 1,
                    decoration: BoxDecoration(
                      
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5),
                        width: 1
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Text('No Trading Calls !',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8)
                    ),),
                  ),

                  SizedBox(height: 120,)
                  ]
                  ,
                ),
              )

              
          ],
        )
      ),
    );
  }
}

