import 'package:flutter/material.dart';
class brokerscreen extends StatefulWidget {
  @override
  _brokerscreenState createState() => _brokerscreenState();
}

class _brokerscreenState extends State<brokerscreen> {
  double progressValue = 0.0;
  double _profit = 0.75; // Initial profit percentage
  String _selectedOption = 'Weekly';
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Line App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Progress Line
            Container(
              height: 30,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 15,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 2,
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 20,
                      color: Colors.yellow,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 5,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 5,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 5,
                    child: Container(
                      width: progressValue * (MediaQuery.of(context).size.width - 40),
                      height: 20,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
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
                  items: ['Weekly', 'Monthly', 'Yearly','angel broking','kotak securities','eh'].map((String option) {
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

            // DropdownButton<String>(
            //       value: selectedOption,
            //       items: ['Weekly', 'Monthly', 'Yearly'].map((String option) {
            //         return DropdownMenuItem<String>(
            //           value: option,
            //           child: Text(option,
            //           style: TextStyle(
            //             fontSize: 13
            //           ),),
            //         );
            //       }).toList(),
            //       onChanged: (String? newValue) {
            //         setState(() {
            //       selectedOption = newValue!;
            //       progressValue = 0.5;
            //     });
            //       },
            //     ),

//                 DropdownButton(
//     value: selectedOption,
//     items: [
//       DropdownMenuItem(
//         child: Text("Angel Broking"),
//         value: "Angel Broking"
//       ),
//       DropdownMenuItem(
//         child: Text("Kotak Security"),
//         value: "Kotak Security",
//       )
//     ],
//     onChanged: (value){
//       setState(() {
//         selectedOption = value as String;
//         progressValue = 0.5;
//       });
//     },
// ),

            SizedBox(height: 20),
            // Name TextField and Button
            if (progressValue > 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Enter Name',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        progressValue = 1.0;
                      });
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}