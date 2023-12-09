import 'package:flutter/material.dart';

class watchlist extends StatefulWidget {
  const watchlist({super.key});

  @override
  State<watchlist> createState() => _watchlistState();
}

class _watchlistState extends State<watchlist> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.all(0),
          width: double.infinity,
          child: Image.asset('assets/images/watchlist.png',
          fit: BoxFit.fill,),
        
      
    );
  }
}