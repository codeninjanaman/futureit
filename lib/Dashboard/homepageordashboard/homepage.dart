import 'package:flutter/material.dart';
import 'package:futureit/Dashboard/homepageordashboard/viewholdings.dart';

import 'order.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  

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
      backgroundColor: const Color.fromARGB(255, 16, 16, 16),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15,left: 20,right: 20,),
                color: Colors.black,
                height: 100,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      
                            width: 155,
                            height: 60,
                            padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Color(0xFF8C64FF),
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
                            color: Color(0xFF8C64FF),
                            
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
                                    fontWeight: FontWeight.bold
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
                color: Colors.black,
                height: 80,
                child: Row(
                  children: [
                    Container(
                            width: 156,
                            height: 60,
                            padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF8C64FF),
                          
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
                            color: Color(0xFF8C64FF),
                            
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
                          color: _selectedTabIndex == 0 ? Colors.blue : Colors.transparent,
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
                          color: _selectedTabIndex == 1 ? Colors.blue : Colors.transparent,
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
                  viewholdings(height: height, width: width)
                  
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
              )
          ],
        )
      ),
    );
  }
}

