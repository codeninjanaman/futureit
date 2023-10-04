import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/signupcontroller.dart';

class orderbook extends StatefulWidget {
  const orderbook({super.key});

  @override
  State<orderbook> createState() => _orderbookState();
}

class _orderbookState extends State<orderbook> {
  @override
  Widget build(BuildContext context) {
    
    final controller = Get.put(SignUpController());
    return Scaffold(
      body: Center(child: Text('OrderBook')),
    );
  }
}


