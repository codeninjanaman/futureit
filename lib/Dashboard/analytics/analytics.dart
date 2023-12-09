// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import '../../constants.dart';

// class analytics extends StatefulWidget {
//   const analytics({super.key});

//   @override
//   State<analytics> createState() => _analyticsState();
// }

// class _analyticsState extends State<analytics> {
//   String selectedOption = 'Weekly'; 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Pallete.color1,
//       appBar: AppBar(
//         bottom: PreferredSize(
//             preferredSize: Size.fromHeight(1), // Set the height of the white border
//             child: Container(
//               color: Colors.grey.shade700, // Color of the white border
//               height: 1, // Thickness of the white border
//             ),
//           ),
//         backgroundColor: Pallete.color1,
//         title: Text('Analytics',
//         style: TextStyle(
//           color: Colors.white
//         ),),

//         leading: IconButton(onPressed: (){
//           Get.back();
//         }, icon: Icon(Icons.arrow_back,
//         color: Colors.white,))
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 15,),
//               CircularPercentIndicator(
//                 radius: 150,
//                 animation: true,
//                 animationDuration: 1000,
//                 lineWidth: 21,
//                 percent: 0.4,
//                 progressColor: Pallete.color2,
//                 backgroundColor: Colors.white.withOpacity(0.85),
//                 circularStrokeCap: CircularStrokeCap.round,
//                 center: Text('Total Earning \n  + ₹0.0000',
//                 style: TextStyle(color: Colors.white,
//                 fontSize: 18),)
//                 // Column(
//                 //   children: [
//                 //     Text('Total Earnings',
//                 //     style: TextStyle(
//                 //       color: Colors.white.withOpacity(0.8),
//                 //       fontSize: 18
//                 //     ),),

//                 //     Text('+ ₹0.00000',
//                 //     style: TextStyle(
//                 //       color: Colors.white.withOpacity(0.8),
//                 //       fontSize: 18
//                 //     ),)
//                 //   ],
//                 // ),

//               ),
//               SizedBox(height: 20,),

//               Text('Total Profit',
//               style: TextStyle(
//                 color: Colors.white.withOpacity(0.8)
//               ),),
//               SizedBox(height: 8,),
//               Container(
//                 padding: EdgeInsets.all(8),
//                 height: 40,
//                 width: 90,
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.8),

//                 ),
//                 child: DropdownButton<String>(
//                 value: selectedOption,
//                 onChanged: (newValue) {
//                   setState(() {
//                     selectedOption = newValue!;
//                   });
//                 },
//                 items: <String>[
//                   'Weekly',
//                   'Monthly',
//                   'Yearly',
//                 ].map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value,
//                     style: TextStyle(
//                       fontSize: 12
//                     ),),
//                   );
//                 }).toList(),
//                           ),
//               ),
//             SizedBox(height: 30,),
//             Center(
//               child: Text('No Earning in the past',
//               style: TextStyle(
//                 color: Colors.white.withOpacity(0.8),
//                 fontSize: 14
//               ),),
//             )
//             ],
//           ),
//         ),
//       )
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:fl_chart/fl_chart.dart';


class analytics extends StatefulWidget {
  @override
  _analyticsState createState() => _analyticsState();
}

class _analyticsState extends State<analytics> {
  double _profit = 0.75; // Initial profit percentage
  String _selectedOption = 'Weekly';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Scaffold(
        appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1), // Set the height of the white border
            child: Container(
              color: Colors.grey, // Color of the white border
              height: 1, // Thickness of the white border
            ),
          ),
        backgroundColor: Pallete.white,
        title: Text('Analytics',
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
          backgroundColor: Pallete.white,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            CircularPercentIndicator(
              animation: true,
              circularStrokeCap: CircularStrokeCap.round,
              animationDuration: 800,
              radius: 150.0,
              lineWidth: 18.0,
              percent: _profit,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                'Total Earnings',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(fontSize: 18,
                color: Pallete.black),
                )
              ),
              Text("+ ₹ 0.00",
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                color: Colors.green,
                fontSize: 18,
                // fontWeight: FontWeight.w600
              ),
              ))

                ],
              ),
              progressColor: Pallete.yellow1
            ),
            
            SizedBox(height: 12,),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text('Total Profit',
            
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),),
            ),
            SizedBox(height: 10,),
            
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.all(5),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.8),
                ),
                child: DropdownButton<String>(
                  value: _selectedOption,
                  items: ['Weekly', 'Monthly', 'Yearly'].map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option,
                      style: TextStyle(
                        fontSize: 13
                      ),),
                    );
                  }).toList(),
                  onChanged: (String? newOption) {
                    setState(() {
                      _selectedOption = newOption ?? 'Weekly'; // Provide a default option if newOption is null
                      // Update _profit based on the selected option
                      if (_selectedOption == 'Weekly') {
                        // Calculate profit for weekly
                        _profit = 0.75;
                      } else if (_selectedOption == 'Monthly') {
                        // Calculate profit for monthly
                        _profit = 0.65;
                      } else if (_selectedOption == 'Yearly') {
                        // Calculate profit for yearly
                        _profit = 0.85;
                      }
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.white30,
              padding: EdgeInsets.all(16.0),
              child: LineChart(
                SampleData.getSampleData(_selectedOption),
              ),
            ),
          ],
        ),
          ),
          ),
        ),
      ),
    );
  }
}

class SampleData {
  static LineChartData getSampleData(String selectedOption) {
    final List<String> xLabels = [];
    final List<double> yValues = [];

    if (selectedOption == 'Weekly') {
      // Generate data for weekly chart
      xLabels.addAll(['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']);
      yValues.addAll([5000, 15000, 10000, 22000, 18000, 28000, 25000]);
    } else if (selectedOption == 'Monthly') {
      // Generate data for monthly chart
      xLabels.addAll(['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],);
      yValues.addAll([500000, 550000, 600000, 625000, 640000, 670000, 700000, 720000, 750000, 780000, 800000, 820000]);
      
    } else if (selectedOption == 'Yearly') {
      // Generate data for yearly chart
      xLabels.addAll(['2020', '2021', '2022', '2023', '2024', '2025', '2026', '2027', '2028', '2029', '2030']);
      yValues.addAll([10000000, 12000000, 14000000, 15000000, 16000000, 18000000, 19000000, 20000000, 22000000, 24000000, 26000000]);
    }

    return LineChartData(
      gridData: FlGridData(show: true),
      // titlesData: FlTitlesData(show: true,),
      // borderData: FlBorderData(show: true),
      minX: 0,
      maxX: xLabels.length.toDouble()-1,
      minY: 0,
      maxY: yValues.reduce((a, b) => a > b ? a : b),
      lineBarsData: [
        LineChartBarData(
          isCurved: true,
          spots: yValues.asMap().entries.map((entry) {
            return FlSpot(entry.key.toDouble(), entry.value,
            );
          }).toList(),
          color: Colors.blue,
          dotData: FlDotData(show: true),
          belowBarData: BarAreaData(show: true),
        ),
      ],
    );
  }
}










