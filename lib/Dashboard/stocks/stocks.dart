import 'package:flutter/material.dart';
import 'package:futureit/profile/profile_screen.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../authentication/models/user_model.dart';
import '../../authentication_repositary/authentication_repositary.dart';
import '../../controller/profilecontroller.dart';

class stockshomepage extends StatefulWidget {
  const stockshomepage({super.key});

  @override
  State<stockshomepage> createState() => _stockshomepageState();
}

class _stockshomepageState extends State<stockshomepage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return  Scaffold(
        // appBar: AppBar(
          
        //   backgroundColor: Colors.transparent,
        //   leading: Icon(Icons.circle_notifications_outlined,
        //   color: Colors.white,),

        //   title: SizedBox( 
        //     height: 40,
        //     child: TextFormField(
              
        //       decoration: const InputDecoration(
                
        //         label: Text("Search",
        //         style: TextStyle(fontSize: 15,
        //         color: Colors.white),),
        //         prefixIcon: Icon(Icons.search,
        //         color: Colors.white,),
        //         border: OutlineInputBorder(),
        //         labelStyle: TextStyle(color: Colors.white),
        //         // focusedBorder: OutlineInputBorder(
        //         //   borderSide: BorderSide(width: 2.0,
        //         //   color:Color.fromARGB(221, 44, 42, 42))
        //         // )
                
        //       )
        //     ),
        //   ),
        //   actions: [
        //     Container(
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(100),
        //         color: Colors.transparent

        //       ),
        //       child: IconButton(onPressed: (){
        //         Get.to(()=>ProfileScreen());
        //       }, icon: Icon(Icons.person,
        //       color: Colors.white,)),
        //     )

        //   ],
        // ),
        backgroundColor: const Color.fromARGB(255, 16, 16, 16),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                            width: 155,
                            height: 60,
                            padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 16, 16, 16),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade900
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("NIFTY 50",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12
                              ),),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text('19,310.15',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12
                                  ),)
                                  ,
                                  Text(' -55.10 (0.28%)',
                                  
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12
                                  ),)
                                ],
                              )
                            ],
                          )
                          ),
                     SizedBox(width: 20,),
                     Container(
                            width: 155,
                            height: 60,
                            padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 16, 16, 16),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade900
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("BANK NIFTY",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12
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
                                    fontSize: 12
                                  ),)
                                ],
                              )
                            ],
                          )
                          ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                            width: 160,
                            height: 60,
                            padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 16, 16, 16),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade900
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("SENSEX",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12
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
                                  Text(' -202.36 (0.31%)',
                                  
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12
                                  ),)
                                ],
                              )
                            ],
                          )
                          ),
                    SizedBox(width: 18,),
                    Container(
                            width: 152,
                            height: 60,
                            padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 16, 16, 16),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade900
                            ),
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
              
                SizedBox(height: 20,),

                SizedBox(
                child: FutureBuilder(
                  future: controller.getUserData(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.done){
                      if(snapshot.hasData){
                        UserModel user = snapshot.data as UserModel;
                        String fullname = user.fullName.toString();
                        return Text("Welcome $fullname",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                          
                        ),);
                        
                      }
                    }
                    return Text("Loading");
                  
                  }),
              ),

                
                Text("Make your finacial game strong,",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14
                ),),
                
                SizedBox(height: 20,),

                GestureDetector(
      onTap: (){},
      child: Container(
        
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(10),
          color: Colors.green[200]
        ),
        child: Row(
          children: [
            Icon(Icons.bar_chart_rounded, size: 60,),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text("Stocks",
               style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
               ),),
               Text("Explore & Invest in companies!",
               overflow: TextOverflow.ellipsis,
               style: TextStyle(
                color: Colors.white
               ),)
              ],
            )
          ],
        ),
      ),
    ),
    SizedBox(height: 10,),

             GestureDetector(
      onTap: (){},
      child: Container(
        
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue[200]
        ),
        child: Row(
          children: [
            Icon(Icons.pie_chart, size: 60,),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text("Mutual Fund",
               style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
               ),),
               Text("Get 0.6% p.a. Extra Returns",
               overflow: TextOverflow.ellipsis,
               style: TextStyle(
                color: Colors.white
               ),)
              ],
            )
          ],
        ),
      ),
    ),

    SizedBox(height: 10,),

             GestureDetector(
      onTap: (){
        // Get.to(()=> cryptosplash());
      },
      child: Container(
        
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(10),
          color: Colors.pink[200]
        ),
        child: Row(
          children: [
            Icon(LineAwesomeIcons.coins, size: 60,),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text("Cryptocurrency",
               style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
               ),),
               Text("Invest in Cryptocurrencies!",
               overflow: TextOverflow.ellipsis,
               style: TextStyle(
                color: Colors.white
               ),)
              ],
            )
          ],
        ),
      ),
    ),

    SizedBox(height: 10,),

    GestureDetector(
      onTap: (){},
      child: Container(
        
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(10),
          color: Colors.orange[200]
        ),
        child: Row(
          children: [
            Icon(LineAwesomeIcons.piggy_bank, size: 60,),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text("Loans",
               style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
               ),),
               Text("Quick loan up to 5 lakh!",
               overflow: TextOverflow.ellipsis,
               style: TextStyle(
                color: Colors.white
               ),)
              ],
            )
          ],
        ),
      ),
    ),

                Text("Trending Stocks",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 20,),

                Row(
                  children: [

                    Container(
                      height: 140,
                      width: 155,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.shade900
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Image.asset('assets/images/IRFC.png',
                            fit: BoxFit.fill,),
                          ),
                          SizedBox(height: 4,),
                          Text('Indian Railways Financial Corporation',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),
                  
                          SizedBox(height: 10,),
                          Text('₹47.25',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),

                          SizedBox(height: 4,),
                          Text('-0.40(0.84%)',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13,
                          color: Colors.red,
                          ),),
                        ],
                      ),
                      
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 140,
                      width: 155,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.shade900
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Image.asset('assets/images/cochin.png',
                            fit: BoxFit.fill,),
                          ),
                          SizedBox(height: 4,),
                          Text('Cochin Shipyard',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),
                  
                          SizedBox(height: 10,),
                          Text('₹843.45',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),

                          SizedBox(height: 4,),
                          Text('-32.25(3.68%)',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13,
                          color: Colors.red,
                          ),),
                        ],
                      ),
                    )
                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  children: [

                    Container(
                      height: 140,
                      width: 155,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.shade900
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Image.asset('assets/images/vakrangee.png',
                            fit: BoxFit.fill,),
                          ),
                          SizedBox(height: 4,),
                          Text('Vakrangee Limited',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),
                  
                          SizedBox(height: 10,),
                          Text('₹16.15',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),

                          SizedBox(height: 4,),
                          Text('-0.05(0.31%)',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13,
                          color: Colors.red,
                          ),),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 140,
                      width: 155,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.shade900
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Image.asset('assets/images/JMfinancial.png',
                            fit: BoxFit.fill,),
                          ),
                          SizedBox(height: 4,),
                          Text('JM Financial',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),
                  
                          SizedBox(height: 10,),
                          Text('₹81.55',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),

                          SizedBox(height: 4,),
                          Text('+3.30(4.22%)',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13,
                          color: Colors.green,
                          ),),
                        ],
                      ),
                    )
                  ],
                ),
                
              SizedBox(height: 50,),

              Text("Stocks in news",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 20,),

                Row(
                  children: [

                    Container(
                      height: 140,
                      width: 155,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.shade900
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Image.asset('assets/images/concord.png',
                            fit: BoxFit.fill,),
                          ),
                          SizedBox(height: 4,),
                          Text('Concord Biotech',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),
                  
                          SizedBox(height: 10,),
                          Text('₹942.80',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),

                          SizedBox(height: 4,),
                          Text('+201.80(27.23%)',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13,
                          color: Colors.green,
                          ),),
                        ],
                      ),
                      
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 140,
                      width: 155,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.shade900
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Image.asset('assets/images/hcl.png',
                            fit: BoxFit.fill,),
                          ),
                          SizedBox(height: 4,),
                          Text('HCL Technologies',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),
                  
                          SizedBox(height: 10,),
                          Text('₹1,173.70',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),

                          SizedBox(height: 4,),
                          Text('-3.00(0.25%)',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13,
                          color: Colors.red,
                          ),),
                        ],
                      ),
                    )
                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  children: [

                    Container(
                      height: 140,
                      width: 155,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.shade900
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Image.asset('assets/images/tcs.png',
                            fit: BoxFit.fill,),
                          ),
                          SizedBox(height: 4,),
                          Text('TCS',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),
                  
                          SizedBox(height: 10,),
                          Text('₹3,367.10',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),

                          SizedBox(height: 4,),
                          Text('-68.65(2.00%)',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13,
                          color: Colors.red,
                          ),),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 140,
                      width: 155,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.shade900
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('See More >',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          fontWeight: FontWeight.bold,
                          ),),

                          Text('Market News',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
                
              
              ],
            ),
          )
        ),
      
    );
  }
}