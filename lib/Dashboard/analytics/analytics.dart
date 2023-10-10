import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../constants.dart';

class analytics extends StatefulWidget {
  const analytics({super.key});

  @override
  State<analytics> createState() => _analyticsState();
}

class _analyticsState extends State<analytics> {
  String selectedOption = 'Weekly'; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.color1,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1), // Set the height of the white border
            child: Container(
              color: Colors.grey.shade700, // Color of the white border
              height: 1, // Thickness of the white border
            ),
          ),
        backgroundColor: Pallete.color1,
        title: Text('Analytics',
        style: TextStyle(
          color: Colors.white
        ),),

        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,
        color: Colors.white,))
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              CircularPercentIndicator(
                radius: 150,
                animation: true,
                animationDuration: 1000,
                lineWidth: 21,
                percent: 0.4,
                progressColor: Pallete.color2,
                backgroundColor: Colors.white.withOpacity(0.85),
                circularStrokeCap: CircularStrokeCap.round,
                center: Text('Total Earning \n  + ₹0.0000',
                style: TextStyle(color: Colors.white,
                fontSize: 18),)
                // Column(
                //   children: [
                //     Text('Total Earnings',
                //     style: TextStyle(
                //       color: Colors.white.withOpacity(0.8),
                //       fontSize: 18
                //     ),),

                //     Text('+ ₹0.00000',
                //     style: TextStyle(
                //       color: Colors.white.withOpacity(0.8),
                //       fontSize: 18
                //     ),)
                //   ],
                // ),

              ),
              SizedBox(height: 20,),

              Text('Total Profit',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8)
              ),),
              SizedBox(height: 8,),
              Container(
                padding: EdgeInsets.all(8),
                height: 40,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),

                ),
                child: DropdownButton<String>(
                value: selectedOption,
                onChanged: (newValue) {
                  setState(() {
                    selectedOption = newValue!;
                  });
                },
                items: <String>[
                  'Weekly',
                  'Monthly',
                  'Yearly',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                    style: TextStyle(
                      fontSize: 12
                    ),),
                  );
                }).toList(),
                          ),
              ),
            SizedBox(height: 30,),
            Center(
              child: Text('No Earning in the past',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 14
              ),),
            )
            ],
          ),
        ),
      )
    );
  }
}














