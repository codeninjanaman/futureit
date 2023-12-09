import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';


class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen>
    with SingleTickerProviderStateMixin {
  double principal = 0.0;
  double profit = 0.0;
  double trade = 0.0;
  double totalAmount = 0.0;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
  }

  void calculateTotalAmount() {
    setState(() {
      totalAmount = (principal * (profit / 100) * trade);

      _animationController.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text('Profit Calculator',
        style: GoogleFonts.inter(
          textStyle: TextStyle(
          color: Pallete.black,
          fontSize: 16
        )
        ),),

        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,
        color: Pallete.black,))
      ),
      backgroundColor: Pallete.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SliderInput(
              label: 'Amount',
              value: principal,
              onChanged: (value) {
                setState(() {
                  principal = value;
                });
              },
              max: 100000,
            ),
            SizedBox(height: 50.0),
            SliderInput(
              label: 'Profit % on each Trade ',
              value: profit,
              onChanged: (value) {
                setState(() {
                  profit = value;
                });
              },
              max: 100,
              divisions: 100,
            ),
            SizedBox(height: 50.0),
            SliderInput(
              label: 'Number of trade ',
              value: trade,
              onChanged: (value) {
                setState(() {
                  trade = value;
                });
              },
              max: 20,
              divisions: 20,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: calculateTotalAmount,
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.yellow1,
              ),
              child: Text('Calculate', style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 60.0),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Total Profit: ₹',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                  color: Pallete.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                )
                ),
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: totalAmount),
              duration: Duration(seconds: 2),
              builder: (context, value, child) {
                return Text(
                  ' ${value.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 111, 249, 80),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class SliderInput extends StatelessWidget {
  final String label;
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final int divisions;

  SliderInput({
    required this.label,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 100000,
    this.divisions = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            textStyle: TextStyle(color: Pallete.yellow1),
          )
          
        ),
        Slider(
          value: value,
          onChanged: onChanged,
          min: min,
          max: max,
          divisions: divisions,
          activeColor: Pallete.yellow1,
          inactiveColor: Pallete.black,
          label: value.toStringAsFixed(2),
        ),
        Text(
          value.toStringAsFixed(2),
          style: TextStyle(color: Pallete.black),
        ),
      ],
    );
  }
}